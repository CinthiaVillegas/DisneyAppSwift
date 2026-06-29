//
//  MainTabView.swift
//  MyDisneyApp
//
//  Created by Cinthia Villegas on 28/06/26.
//

import SwiftUI

struct MainTabView: View {

    let container: DIContainer

    var body: some View {

        TabView {

            HomeView(container: container)

                .tabItem {

                    Label("Home", systemImage: "house.fill")

                }

            FavoritesView(container: container)
                .tabItem {

                    Label("Favoritos", systemImage: "heart.fill")

                }

        }

    }
}
