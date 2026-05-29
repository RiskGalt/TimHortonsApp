//
//  Coffee.swift
//  CoffeeApp2
//
//  Created by Louise Rennick on 2026-05-25.
//


import Foundation
import SwiftData

@Model
class Coffee: Codable {
    
    var id: String
    var name: String
    var coffeeDescription: String
    var price: Double
    var image: String
    var category: String
    
    init(
        id: String,
        name: String,
        coffeeDescription: String,
        price: Double,
        image: String,
        category: String
    ) {
        self.id = id
        self.name = name
        self.coffeeDescription = coffeeDescription
        self.price = price
        self.image = image
        self.category = category
    }
    
    enum CodingKeys: String, CodingKey {
          case id
          case name
          case coffeeDescription
          case price
          case image
          case category
      }
      
      required init(from decoder: Decoder) throws {
          let container = try decoder.container(keyedBy: CodingKeys.self)
          
          id = try container.decode(String.self, forKey: .id)
          name = try container.decode(String.self, forKey: .name)
          coffeeDescription = try container.decode(String.self, forKey: .coffeeDescription)
          price = try container.decode(Double.self, forKey: .price)
          image = try container.decode(String.self, forKey: .image)
          category = try container.decode(String.self, forKey: .category)
      }
      
      func encode(to encoder: Encoder) throws {
          var container = encoder.container(keyedBy: CodingKeys.self)
          
          try container.encode(id, forKey: .id)
          try container.encode(name, forKey: .name)
          try container.encode(coffeeDescription, forKey: .coffeeDescription)
          try container.encode(price, forKey: .price)
          try container.encode(image, forKey: .image)
          try container.encode(category, forKey: .category)
      }
}
