//
//  CoffeeApp2App.swift
//  CoffeeApp2
//
//  Created by Louise Rennick on 2026-05-25.
//

import SwiftUI
import SwiftData

@main
struct CoffeeApp2App: App {
    
    @StateObject private var cart = CartManager()
    
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(cart)
        }
        .modelContainer(for: Coffee.self)
    }
}
