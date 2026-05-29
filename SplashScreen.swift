//
//  SplashScreen.swift
//  CoffeeApp2
//
//  Created by Louise Rennick on 2026-05-26.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    @State private var scale: CGFloat = 0.8
    
    var body: some View {
        
        if isActive {
            ContentView()
        } else {
            
            ZStack {
                Color.brown
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    Image(systemName: "cup.and.saucer.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                        .scaleEffect(scale)
                        .onAppear {
                            withAnimation(
                                .easeInOut(duration: 1.2)
                                .repeatForever(autoreverses: true)
                            ) {
                                scale = 1.0
                            }
                        }
                    
                    Text("CoffeeApp ☕")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
