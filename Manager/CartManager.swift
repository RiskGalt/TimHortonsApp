//
//  CartManager.swift
//  CoffeeApp2
//
//  Created by Louise Rennick on 2026-05-26.
//
import Foundation
import SwiftUI
import Combine
import SwiftData

class CartManager: ObservableObject {
    
    @Published var items: [CartItem] = []
    
    // Add coffee to cart
    func add(_ coffee: Coffee) {
        
        if let index = items.firstIndex(where: {
            $0.coffee.id == coffee.id
        }) {
            
            items[index].quantity += 1
            
        } else {
            
            let newItem = CartItem(
                id: UUID(),
                  coffee: coffee,
                  quantity: 1
            )
            
            items.append(newItem)
        }
    }
    
    // Remove item
    func remove(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    // Update quantity
    func updateQuantity(
        for item: CartItem,
        quantity: Int
    ) {
        if let index = items.firstIndex(where: {
            $0.id == item.id
        }) {
            items[index].quantity = quantity
        }
    }
    
    // Calculate total
    var total: Double {
        items.reduce(0) { total, item in
            
            total + (
                item.coffee.price *
                Double(item.quantity)
            )
        }
    }
}
