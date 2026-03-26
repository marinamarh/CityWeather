//
//  CityWeather.swift
//  CityWeather
//
//  Created by Marina Marhitych on 22.03.2026.
//

import Foundation

struct CityWeather: Identifiable, Hashable, Sendable, Codable {
    let id: Int
    let cityName: String
    let country: String
    let temperature: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let humidity: Int
    let pressure: Int
    let rain: Double?
    let windSpeed: Double
    let cloudiness: Int
    let visibility: Int
    let description: String
    let icon: String
    let sunrise: Date?
    let sunset: Date?
    var isFavorite: Bool
}

extension CityWeather {
    var iconURL: URL? {
        URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")
    }

    var temperatureString: String {
        "\(Int(temperature.rounded()))°C"
    }

    var feelsLikeString: String {
        "Feels like: \(Int(feelsLike.rounded()))°C"
    }

    var humidityString: String {
        "Humidity: \(humidity)%"
    }

    var windString: String {
        "Wind: \(String(format: "%.1f", windSpeed)) m/s"
    }
    
    var rainString: String {
        if let rain {
            return "Rain: \(String(format: "%.1f mm/h", rain))"
        } else {
            return "No Rain"
        }
    }
}

extension WeatherResponse {
    func toCityWeather(isFavorite: Bool = false) -> CityWeather {
        CityWeather(
            id: id, cityName: name, country: sys.country ?? "",
            temperature: main.temp, feelsLike: main.feelsLike, tempMin: main.tempMin, tempMax: main.tempMax,
            humidity: main.humidity, pressure: main.pressure, rain: rain?.oneHour, windSpeed: wind.speed, cloudiness: clouds.all, visibility: visibility ?? 0,
            description: weather.first?.description ?? "", icon: weather.first?.icon ?? "",
            sunrise: sys.sunrise.map { Date(timeIntervalSince1970: $0) },
            sunset: sys.sunset.map { Date(timeIntervalSince1970: $0) }, isFavorite: isFavorite
        )
    }
}
