//
//  ContentView.swift
//  WeatherApp
//
//  Created by Marta Molina Aguilera on 25/3/22.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        VStack{
            Text("Your location")
                .font(.largeTitle)
                .padding()
            Text("25ºC")
                .font(.system(size: 70))
                .bold()
            Text("🌦")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
