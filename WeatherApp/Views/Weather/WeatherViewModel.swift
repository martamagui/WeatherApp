//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Marta Molina Aguilera on 25/3/22.
//

import Foundation

private let defaulIcon = "😅"
private let iconMap = [
    "Drizzle": "🌨",
    "Rain": "🌧",
    "Snow":"⛄",
    "Clear":"☀️",
    "Clouds": "🌥"]

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
                self.temperature = "\(weather.temperature) ºC"
                self.weatherDescription = weather.description.capitalized
                self.weatherIcon = iconMap[weather.iconName] ?? defaulIcon
            }
        }
    }
}
