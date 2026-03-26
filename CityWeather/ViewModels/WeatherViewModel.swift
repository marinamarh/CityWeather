//
//  WeatherViewModel.swift
//  CityWeather
//
//  Created by Marina Marhitych on 23.03.2026.
//

import Foundation

@Observable
class WeatherViewModel {
    var weatherList: [CityWeather] = []
    var isLoading = false
    var errorMessage: String?
    
    private let service = WeatherService()
    private let cities = ["Kyiv", "Lviv", "Kharkiv", "Dnipro", "Uzhhorod", "Zaporizhzhia", "Vinnytsia"]
    
    func fetchWeather() {
        isLoading = true
        errorMessage = nil
        
        Task {
            var results: [CityWeather] = []
            
            for city in cities {
                do {
                    let weather = try await service.fetchWeather(for: city)
                    results.append(weather)
                } catch {
                    print("Error fetching weather for \(city): \(error)")
                }
            }
            
            if results.isEmpty {
                errorMessage = "Failed to load data."
            } else {
                self.weatherList = results.sorted { $0.cityName < $1.cityName }
            }
            
            isLoading = false
        }
    }
    
    // MARK: Preview
    
    static var example: WeatherViewModel {
        let viewModel = WeatherViewModel()
        viewModel.weatherList = [
            CityWeather(id: 703448, cityName: "Kyiv", country: "UA", temperature: 22.0, feelsLike: 21.0, tempMin: 18.0, tempMax: 25.0, humidity: 50, pressure: 1013, rain: nil, windSpeed: 3.0, cloudiness: 0, visibility: 10000, description: "Clear", icon: "01d", sunrise: Date(), sunset: Date(), isFavorite: false)
        ]
        
        return viewModel
    }
}
