//
//  RoundViews.swift
//  BullsEye
//
//  Created by Павел Николаев on 29.10.2023.
//

import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName: String
  var body: some View {
    Image(systemName: systemName)
      .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
      .overlay(
        Circle()
          .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
      )
  }
}
struct RoundedImageViewFilled: View {
  var systemName: String
  var body: some View {
    Image(systemName: systemName)
      .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength )
      .kerning(-0.2)
      .background(
        Circle()
          .fill(Color("ButtonFilledBackgroundColor"))
      )
  }
}

struct RoundedRectTextView: View {
  var text: String
  
  var body: some View {
    Text(text)
      .font(.title3)
      .fontWeight(.bold)
      .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
      .overlay(
        RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
          .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
      )
  }
}



struct PreviewView: View {
  var body: some View {
    VStack {
      RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      RoundedImageViewFilled(systemName: "list.dash")
      RoundedRectTextView(text: "999")
      RoundedTextView(text: "1")
    }
    .padding()
  }
}

struct RoundedTextView: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.title3)
      .fontWeight(.bold)
      .frame(width: Constants.General.roundRectViewHeight, height: Constants.General.roundRectViewHeight)
      .overlay(
        RoundedRectangle(cornerRadius: 100)
          .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
      )
  }
}


struct RoundViews: PreviewProvider {
  static var previews: some View {
    PreviewView()
    PreviewView()
      .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
  }
}
