//
//  CoffeeCardView.swift
//  CoffeeApp2
//
//  Created by Louise Rennick on 2026-05-26.
//

import SwiftUI
import SwiftData

struct CoffeeCardView: View {
    
    let coffee: Coffee
    
    @EnvironmentObject var cart: CartManager
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Image(coffee.image)
                .resizable()
                .scaledToFit()
                .frame(height: 120)
                .clipped()
            
            Text(coffee.name)
                .font(.title3)
                .bold()
            
            Text(coffee.coffeeDescription)
                .font(.subheadline)
                .foregroundStyle(.gray)
            
            HStack {
                
                Text("$\(coffee.price, specifier: "%.2f")")
                    .font(.headline)
                
                Spacer()
                
                Button {
                    cart.add(coffee)
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundColor(.brown)
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

#Preview {
    CoffeeCardView(
        coffee: Coffee(
            id: "1",
            name: "Espresso",
            coffeeDescription: "Strong coffee",
            price: 2.99,
            image: "coffee",
            category: "Hot"
        )
    )
    .environmentObject(CartManager())
}
