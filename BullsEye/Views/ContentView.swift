//
//  ContentView.swift
//  BullsEye
//
//  Created by Павел Николаев on 19.10.2023.
//

import SwiftUI

struct ContentView: View {
  
  @State private var alertIsVisible = false
  @State private var sliderValue = 50.0
  @State private var game  = Game()
  
  var body: some View {
    VStack {
      Text("🎯🎯🎯\nПОПАДИ В ЦЕЛЬ")
        .bold()
        .multilineTextAlignment(.center)
        .lineSpacing(4.0)
        .font(.footnote)
        .kerning(2.0)
      Text(String (game.target))
        .fontWeight(.black)
        .font(.largeTitle)
        .kerning(-1.0)
      HStack {
        Text("1")
          .bold()
          .kerning(1.5)
        Slider(value: $sliderValue,in: 0...100)
        Text("100")
          .bold()
      }
      Button("Проверить") {
        alertIsVisible = true
        print("button pressed")
      }
      .alert("Alert text",
             isPresented: $alertIsVisible,
             actions: {
        Button("Окей") {
          print("alert closed")
        }
      },
             message: {
        let roundedValue = Int(sliderValue.rounded())
        Text("""
             Вы выбрали число \(Int(roundedValue))
             Вы набрали \(game.points(sliderValue: roundedValue)) баллов в этом раунде
        """
        )}
      )
    }
  }
}

#Preview {
  ContentView()
}
