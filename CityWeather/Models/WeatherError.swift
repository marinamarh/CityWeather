//
//  WeatherError.swift
//  CityWeather
//
//  Created by Marina Marhitych on 22.03.2026.
//

import Foundation


enum WeatherError: LocalizedError, Sendable {
    case invalidURL
    case cityNotFound
    case unauthorized
    case networkError(Int)
    case decodingError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:         
            return "The URl is invalid"
        case .cityNotFound:
            return "The city is not found"
        case .unauthorized:
            return "Wrong API key"
        case .networkError(let error):
            return "Network error: \(error)"
        case .decodingError(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        }
    }
}
