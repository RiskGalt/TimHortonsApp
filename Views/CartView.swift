//
//  CartView.swift
//  CoffeeApp2
//
//  Created by Louise Rennick on 2026-05-26.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cart: CartManager
    
    var body: some View {
        VStack {
            List {
                ForEach(cart.items) { item in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(item.coffee.name)
                                .font(.headline)
                            
                            Spacer()
                            
                            Text("$\(item.coffee.price, specifier: "%.2f")")
                        }
                        
                        Stepper(
                            value: Binding(
                                get: { item.quantity },
                                set: { cart.updateQuantity(for: item, quantity: $0) }
                            ),
                            in: 1...10
                        ) {
                            Text("Quantity: \(item.quantity)")
                        }
                    }
                    .padding(.vertical, 4)
                }
                .onDelete(perform: cart.remove)
            }
            
            Text("Total: $\(cart.total, specifier: "%.2f")")
                .font(.title2)
                .padding()
            
            Button("Checkout") {
                print("Checkout tapped")
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.brown)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding()
        }
        .navigationTitle("Your Cart")
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}
