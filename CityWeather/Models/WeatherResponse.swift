//
//  WeatherResponse.swift
//  CityWeather
//
//  Created by Marina Marhitych on 22.03.2026.
//

import Foundation

struct WeatherResponse: Codable, Sendable {
    let id: Int
    let coord: Coord
    let weather: [WeatherInfo]
    let main: MainInfo
    let visibility: Int?
    let wind: WindInfo
    let rain: RainInfo?
    let clouds: Clouds
    let sys: SysInfo
    let name: String
}

extension WeatherResponse {
    struct Coord: Codable, Sendable {
        let lon: Double
        let lat: Double
    }
    
    struct WeatherInfo: Codable, Sendable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
    
    struct MainInfo: Codable, Sendable {
        let temp: Double
        let feelsLike: Double
        let tempMin: Double
        let tempMax: Double
        let pressure: Int
        let humidity: Int
        
        enum CodingKeys: String, CodingKey {
            case temp, pressure, humidity
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
        }
    }
    
    struct WindInfo: Codable, Sendable {
        let speed: Double
        let deg: Int?
        let gust: Double
    }
    
    struct RainInfo: Codable, Sendable {
        let oneHour: Double?
        
        enum CodingKeys: String, CodingKey {
            case oneHour = "1h"
        }
    }
    
    struct Clouds: Codable, Sendable {
        let all: Int
    }
    
    struct SysInfo: Codable, Sendable {
        let country: String?
        let sunrise: TimeInterval?
        let sunset: TimeInterval?
    }
}
