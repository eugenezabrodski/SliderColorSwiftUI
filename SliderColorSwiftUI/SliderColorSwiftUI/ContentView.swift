//
//  ContentView.swift
//  SliderColorSwiftUI
//
//  Created by Евгений Забродский on 15.02.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var valueRed: Double = 0
    @State private var valueGreen: Double = 0
    @State private var valueBlue: Double = 0
    @State private var valueRGB = ""
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            VStack {
            HStack {
                Color(red: valueRed, green: valueGreen, blue: valueBlue, opacity: 1)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                Spacer()
                Color(.red)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
            } .padding(.vertical)
            VStack {
                HStack {
                    Slider(value: $valueRed, in: 0...1, step: 0.01)
                    .background(.blue)
                    .cornerRadius(40)
                    TextField("Color", value: $valueRed, formatter: format())
                        .background(.white)
                        .padding()
                }
                HStack {
                    Slider(value: $valueGreen, in: 0...1, step: 0.01)
                    .background(.blue)
                    .cornerRadius(40)
                TextField("Color", text: $valueRGB)
                        .background(.white)
                        .padding()
                }
                HStack {
                Slider(value: $valueBlue, in: 0...1, step: 0.01)
                    .background(.blue)
                    .cornerRadius(40)
                TextField("Color", text: $valueRGB)
                        .background(.white)
                        .padding()
                }
                Text("\(valueRed)")
                Button("Save Color") {
                    Color(red: valueRed, green: valueGreen, blue: valueBlue)
                }
            }
        }
        }
    }
    private func format() -> NumberFormatter{
        let formatter = NumberFormatter()
        formatter.value(forKey: valueRGB)
        return formatter
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
