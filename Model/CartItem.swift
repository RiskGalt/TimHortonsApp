//
//  CartItem.swift
//  CoffeeApp2
//
//  Created by Louise Rennick on 2026-05-27.
//

import Foundation
import SwiftData

@Model

class CartItem  {
    var id = UUID()
    //relationship
    var coffee: Coffee
    var quantity: Int
    
    init(id: UUID, coffee: Coffee, quantity: Int) {
        self.id = id
        self.coffee = coffee
        self.quantity = quantity
    }
}
