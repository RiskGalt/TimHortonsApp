//
//  DataLoader.swift
//  CoffeeApp2
//
//  Created by Louise Rennick on 2026-05-25.
//

import Foundation

func loadCoffeeData() -> [Coffee] {

    guard let url = Bundle.main.url(forResource: "coffeeData", withExtension: "json") else {
        print("JSON file not found")
        return []
    }

    do {

        let data = try Data(contentsOf: url)

        let decoderData = try JSONDecoder().decode([Coffee].self, from: data)

        print("Loaded \(decoderData.count) coffees")

        return decoderData

    } catch {

        print("Error: \(error)")
        return []
    }
}
