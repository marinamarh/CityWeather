//
//  WeatherView.swift
//  CityWeather
//
//  Created by Marina Marhitych on 25.03.2026.
//

import SwiftUI

struct CitiesView: View {
    @State private var viewModel = WeatherViewModel()
    @State private var city: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Enter city name", text: $city)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled()
                        .onSubmit {
                            viewModel.fetchWeather(city: city)
                        }
                        
                    Button {
                        viewModel.fetchWeather(city: city)
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                
                Spacer()
                
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.errorMessage {
                    VStack {
                        Image(systemName: "exclamationmark.triangle")
                            .foregroundStyle(.red)
                        Text(error)
                            .multilineTextAlignment(.center)
                            .padding()
                        Button("Try Again") {
                            viewModel.fetchWeather(city: city)
                        }
                    }
                } else if let weather = viewModel.weather {
                    WeatherDetailView(weatherViewModel: viewModel, weather: weather)
                } else {
                    ContentUnavailableView("No Weather Data", systemImage: "cloud.sun", description: Text("Search for a city to see current weather."))
                }
                
                Spacer()
            }
            .navigationTitle("City Weather")
        }
    }
}

#Preview {
    CitiesView()
}
