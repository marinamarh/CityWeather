//
//  WeatherService.swift
//  CityWeather
//
//  Created by Marina Marhitych on 23.03.2026.
//

import Foundation

struct WeatherService {
    private let apiKey = "a1002f6871d25ccd00b5308cf458b734"
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    
    func fetchWeather(for city: String) async throws -> CityWeather {
        guard var components = URLComponents(string: baseURL) else {
            throw WeatherError.invalidURL
        }
        
        components.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "appid", value: apiKey),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "lang", value: "en")
        ]
        
        guard let url = components.url else {
            throw WeatherError.invalidURL
        }
        
        
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw WeatherError.networkError(0)
        }
        
        switch httpResponse.statusCode {
        case 200:
            do {
                let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                return weatherResponse.toCityWeather()
            } catch {
                throw WeatherError.decodingError(error)
            }
        case 401:
            throw WeatherError.unauthorized
        case 404:
            throw WeatherError.cityNotFound
            default :
            throw WeatherError.networkError(httpResponse.statusCode)
        }
    }
    
}
