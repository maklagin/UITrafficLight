//
//  ContentView.swift
//  UITrafficLight
//
//  Created by Максим Кулагин on 08.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var step = 0
    
    private let isOff = 0.5
    private let isOn = 1.0
    
    var body: some View {
        
        VStack(spacing: 15.0) {
            
            step == 1 ? redCircle.contrast(isOn) : redCircle.contrast(isOff)
            step == 2 ? yellowCircle.contrast(isOn) : yellowCircle.contrast(isOff)
            step == 3 ? greenCircle.contrast(isOn) : greenCircle.contrast(isOff)
            
            Spacer()
            
            startButton
        } .padding()
    }
    
    private var redCircle: some View {
        
        Circle()
            .foregroundColor(.red)
            .frame(width: 150, height: 150)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
    
    private var yellowCircle: some View {
        
        Circle()
            .foregroundColor(.yellow)
            .frame(width: 150, height: 150)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
    
    private var greenCircle: some View {
        
        Circle()
            .foregroundColor(.green)
            .frame(width: 150, height: 150)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
    
    private func incrementStep() {
        step += 1
        if step > 3 { step = 1 }
    }
    
    private var startButton: some View {
        
        Button(action: { incrementStep() })
        {
            Text(step == 0 ? "START" : "NEXT")
                .font(.largeTitle)
                .frame(width: 150, height: 60)
                .foregroundColor(.white)
                .background(Color(hue: 0.800, saturation: 0.800, brightness: 0.750))
                .overlay(Capsule().stroke(Color.white, lineWidth: 4))
                .cornerRadius(50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
