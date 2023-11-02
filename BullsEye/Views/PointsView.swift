//
//  PointsView.swift
//  BullsEye
//
//  Created by Павел Николаев on 03.11.2023.
//

import SwiftUI

struct PointsView: View {
  
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
    
    let roundedValue = Int(sliderValue.rounded())
    let points = game.points(sliderValue: roundedValue)
    
    VStack(spacing: 10) {
      InstructionText(text: "Ваш выбор:")
      BigNumberText(text: String(roundedValue))
      BodyText(text: "Вы набрали \(points) баллов\n🎉🎉🎉")
      Button(action: {
        withAnimation {
          game.startNewRound(points: points)
          alertIsVisible = false
        }
      }) {
        ButtonText(text: "Новый раунд")
      }
    }
      .padding()
      .frame(maxWidth: 300)
      .background(Color("BackgroundColor"))
      .cornerRadius(Constants.General.roundRectCornerRadius)
      .shadow(radius: 10, x: 5, y: 5)
      .transition(.scale)
  }
}


struct pointsView_PreviewView: PreviewProvider {
  
  static private var alertIsVisible = Binding.constant(false)
  static private var sliderValue = Binding.constant(50.0)
  static private var game = Binding.constant(Game())
  
  static var previews: some View {
    PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
    PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
      .previewLayout(.fixed(width: 568, height: 320))
    PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
      .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
      .previewLayout(.fixed(width: 568, height: 320))
      .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
  }
}
