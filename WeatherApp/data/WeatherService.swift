//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Marta Molina Aguilera on 25/3/22.
//

import Foundation
import CoreLocation


public final class WeatherService: NSObject {
    private let locationManager = CLLocationManager()
    private let API_KEY = "85111148107878db739298c7cf4ccc8a"
    private var completionHandler: ((Weather)->Void)?
    public override init() {
        super.init()
        locationManager.delegate = self
    }
    
    public func getWeatherData(_ completionHandler: @escaping((Weather)->Void)){
        self.completionHandler = completionHandler
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func makeDataRequest(forCoodinates coordiantes: CLLocationCoordinate2D){
        guard let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(coordiantes.latitude)&lon=\(coordiantes.longitude)&appid=\(API_KEY)&units=metric".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard error == nil, let data = data else { return }
            
            if let response = try? JSONDecoder().decode(APIResponse.self, from: data) {
                let weather = Weather(response: response)
                self.completionHandler?(weather)
            }
        }.resume()
    }
}

extension WeatherService: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit,
                                didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {return}
        makeDataRequest(forCoodinates: location.coordinate)
    }
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print("Error: \(error.localizedDescription)")
    }
}


