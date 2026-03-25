//
//  FavoriteView.swift
//  CityWeather
//
//  Created by Marina Marhitych on 25.03.2026.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        ContentUnavailableView("No Favorites", systemImage: "heart", description: Text("Add a city to favorites."))
    }
}

#Preview {
    FavoritesView()
}
