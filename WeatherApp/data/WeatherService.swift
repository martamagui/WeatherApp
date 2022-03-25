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
    private var completionHandler: (()->Void)?
}


