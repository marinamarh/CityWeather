//
//  WeatherView.swift
//  CityWeather
//
//  Created by Marina Marhitych on 25.03.2026.
//

import SwiftUI

struct CitiesView: View {
    @State private var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
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
                            viewModel.fetchWeather()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                } else {
                    List(viewModel.weatherList) { weather in
                        NavigationLink {
                            WeatherDetailView(weatherViewModel: viewModel, weather: weather)
                        } label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(weather.cityName)
                                    
                                    Text(weather.description.capitalized)
                                        .foregroundStyle(.secondary)
                                }
                                
                                Spacer()
                                
                                Text(weather.temperatureString)
                            }
                            .padding()
                        }
                    }
                }
            }
            .navigationTitle("City Weather")
            .onAppear {
                if viewModel.weatherList.isEmpty {
                    viewModel.fetchWeather()
                }
            }
        }
    }
}

#Preview {
    CitiesView()
}
