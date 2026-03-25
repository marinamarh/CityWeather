//
//  WeatherDetailView.swift
//  CityWeather
//
//  Created by Marina Marhitych on 25.03.2026.
//

import SwiftUI

struct WeatherDetailView: View {
    let weatherViewModel: WeatherViewModel
    let weather: CityWeather
    
    var body: some View {
        VStack(spacing: 20) {
            Text(weather.cityName)
            
            if let url = weather.iconURL {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                } placeholder: {
                    ProgressView()
                }
            }
            
            Text(weather.temperatureString)
            Text(weather.rainString)
            Text(weather.windString)
        }
    }
}


#Preview {
    WeatherDetailView(weatherViewModel: WeatherViewModel.example, weather: WeatherViewModel.example.weather!)
}
