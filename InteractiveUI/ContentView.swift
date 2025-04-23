//
//  ContentView.swift
//  InteractiveUI
//
//  Created by Manjot Kaur on 4/23/25.
//

//alert source: https://www.hackingwithswift.com/quick-start/swiftui/how-to-show-an-alert

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var favoriteFood = ""
    @State private var textTitle = "What is your name and favorite food?"
    @State private var presentAlert = false
    @State private var date = Date()
    var body: some View {
        VStack {
            Text(textTitle)
                .font(.title)
                .multilineTextAlignment(.center)
            TextField("Type your name here...", text: $name)
                .multilineTextAlignment(.center)
                .font(.title)
                .border(Color.gray, width:1)
            TextField("Type your favorite food here...", text: $favoriteFood)
                .multilineTextAlignment(.center)
                .font(.title)
                .border(Color.gray, width:1)
            DatePicker(
                    "Select date",
                    selection: $date,
                    displayedComponents: [.date]
                )
            Button("Submit") {
                textTitle = "Welcome, \(name)! \(favoriteFood) is delicious!"
                presentAlert = true
                name = ""
                favoriteFood = ""
            }
            .font(.title2)
            .buttonStyle(.borderedProminent)
            .tint(.purple)
        }
        .padding()
        .alert("Successfully submitted!", isPresented: $presentAlert) {
            Button("OK", role: .cancel) {}
        }
    }
}

#Preview {
    ContentView()
}
