//
//  ContentView.swift
//  CityWeather
//
//  Created by Marina Marhitych on 22.03.2026.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            Tab("Weather", systemImage: "cloud.sun") {
                CitiesView()
            }
            
            Tab("Favorites", systemImage: "heart") {
                FavoritesView()
            }
        }
    }
}

#Preview {
    ContentView()
}
