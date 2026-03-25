//
//  WeatherViewModel.swift
//  CityWeather
//
//  Created by Marina Marhitych on 23.03.2026.
//

import Foundation

@Observable
class WeatherViewModel {
    var weather: CityWeather?
    var isLoading = false
    var errorMessage: String?
    
    private let service = WeatherService()
    
    func fetchWeather(city: String) {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                let weather = try await service.fetchWeather(for: city)
                self.weather = weather
                isLoading = false
            } catch {
                errorMessage = "Failed to fetch weather for \(city), \(error.localizedDescription)"
                isLoading = false
            }
        }
    }
    
    // MARK: Preview
    
    static var example: WeatherViewModel {
        let viewModel = WeatherViewModel()
            viewModel.weather = CityWeather(
                id: UUID(),
                cityName: "London",
                country: "GB",
                temperature: 18.5,
                feelsLike: 17.0,
                tempMin: 15.0,
                tempMax: 21.0,
                humidity: 72,
                pressure: 1013,
                rain: 1.2,
                windSpeed: 4.2,
                cloudiness: 40,
                visibility: 10000,
                description: "scattered clouds",
                icon: "03d",
                sunrise: Date(),
                sunset: Date().addingTimeInterval(3600 * 8),
                isFavorite: false
            )
            return viewModel
    }
}
