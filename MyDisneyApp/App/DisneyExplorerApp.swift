//
//  DisneyExplorerApp.swift
//  MyDisneyApp
//
//  Created by Cinthia Villegas on 28/06/26.
//
import SwiftUI

@main
struct MyDisneyApp: App {

    let container = DIContainer()

    var body: some Scene {
        WindowGroup {
            MainTabView(container: container)
            
        }
    }
}
