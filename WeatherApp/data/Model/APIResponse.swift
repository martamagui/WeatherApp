//
//  APIResponse.swift
//  WeatherApp
//
//  Created by Marta Molina Aguilera on 25/3/22.
//

import Foundation

struct APIResponse: Decodable {
    let name: String
    let main: APIMain
    let weather: [APIWeather]
}
struct APIMain: Decodable {
    let temp: Double
}

struct APIWeather: Decodable {
    let description: String
    let iconName: String
    
    enum CodingKeys: String, CodingKey {
        case description
        case iconName = "main"
    }
}
