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
    ZStack {
      BackgroundView(game: $game)
      
      VStack {
        InstructionView(game: $game)
          .padding(.bottom, alertIsVisible ? 0 : 100)
        if alertIsVisible {
          PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            .transition(.scale)
        } else {
          HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            .transition(.scale)
        }
      }
      if !alertIsVisible {
        SliderView(sliderValue: $sliderValue)
          .transition(.scale)
      }
    }
    
  }
  
}

struct InstructionView: View {
  @Binding var game: Game
  var body: some View {
    VStack {
      InstructionText(text: "🎯🎯🎯\nПопади в цель")
        .padding(.leading, 30.0)
        .padding(.trailing, 30.0)
      
      BigNumberText(text: String(game.target))
    }
  }
}

struct SliderView: View {
  @Binding var sliderValue: Double
  var body: some View {
    HStack {
      SliderLabelText(label: "1")
      
      Slider(value: $sliderValue,in: 1...100)
      
      SliderLabelText(label: "100")
    }
    .padding()
  }
}

struct HitMeButton: View {
  
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
    Button("Проверить".uppercased()) {
      withAnimation {
        alertIsVisible = true
        print("button pressed")
      }
    }
    .padding(20.0)
    
    .background(
      ZStack {
        Color("ButtonColor")
        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.30), Color.clear]), startPoint: .top, endPoint: .bottom)
      }
      
    )
    .foregroundColor(Color.white)
    .cornerRadius(Constants.General.roundRectCornerRadius)
    .bold()
    .font(.title3)
    
    .overlay(
      RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
        .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
    )
    
//    .alert("Раунд \(game.currentRound)",
//           isPresented: $alertIsVisible,
//           actions: {
//      Button("Окей") {
//        print("alert closed")
//        game.startNewRound(points: game.points(sliderValue: Int(sliderValue)))
//      }
//    },
//           message: {
//      let roundedValue = Int(sliderValue.rounded())
//      let points = game.points(sliderValue: roundedValue)
//      Text("""
//           Вы выбрали число \(Int(roundedValue))
//           Вы набрали \(points) баллов в этом раунде
//      """
//      )}
//    )
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView()
      .previewLayout(.fixed(width: 568, height: 320))
    ContentView()
      .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    ContentView()
      .previewLayout(.fixed(width: 568, height: 320))
      .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
  }
}
