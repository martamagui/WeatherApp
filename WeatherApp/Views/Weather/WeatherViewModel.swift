//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Marta Molina Aguilera on 25/3/22.
//

import Foundation

private let defaulIcon = "π"
private let iconMap = [
    "Drizzle": "π¨",
    "Rain": "π§",
    "Snow":"β",
    "Clear":"βοΈ",
    "Clouds": "π₯"]

class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "--"
    @Published var weatherDescription: String = "--"
    @Published var weatherIcon: String = defaulIcon
    
    public let weatherService: WeatherService
    init(weatherService: WeatherService){
        self.weatherService = weatherService
    }
    func refres(){
        weatherService.getWeatherData{weather in
            //Para actualizar la vista en la vista
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = "\(weather.temperature) ΒΊC"
                self.weatherDescription = weather.description.capitalized
                self.weatherIcon = iconMap[weather.iconName] ?? defaulIcon
            }
        }
    }
}
