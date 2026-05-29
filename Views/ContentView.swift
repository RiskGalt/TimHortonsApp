//
//  ContentView.swift
//  CoffeeApp2
//
//  Created by Louise Rennick on 2026-05-25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query private var coffees: [Coffee]
    @Environment(\.modelContext) private var context
    
    @State private var searchText = ""
    @State private var selectedCategory = "All"
    //@StateObject private var cart = CartManager()
    
    let categories = ["All", "Hot", "Cold"]
    
    var filteredCoffee: [Coffee] {
        coffees.filter { coffee in
            (selectedCategory == "All" || coffee.category == selectedCategory)
            &&
            (searchText.isEmpty ||
             coffee.name.lowercased().contains(searchText.lowercased()))
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Coffee Count: \(coffees.count)")
                
                Picker("Category", selection: $selectedCategory) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                ScrollView {
                    LazyVGrid(
                        columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ],
                        spacing: 15
                    ) {
                        ForEach(filteredCoffee) { coffee in
                            CoffeeCardView(coffee: coffee)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Coffee Menu ☕")
            .searchable(text: $searchText)
            .toolbar {
                NavigationLink {
                    CartView()
                } label: {
                    Image(systemName: "cart")
                }
            }
            .onAppear {
                seedCoffeeDataIfNeeded()
            }
        }
    }
    
    func seedCoffeeDataIfNeeded() {
        guard coffees.isEmpty else { return }
        
        let sampleCoffees = loadCoffeeData()
        
        for coffee in sampleCoffees {
            context.insert(coffee)
        }
        
        print("Inserted \(sampleCoffees.count) coffees into SwiftData")
    }
}

    #Preview {
        ContentView()
            .environmentObject(CartManager())
            .modelContainer(for: Coffee.self, inMemory: true)
    }

