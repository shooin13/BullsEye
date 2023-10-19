//
//  ContentView.swift
//  BullsEye
//
//  Created by Павел Николаев on 19.10.2023.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Text("🎯🎯🎯\nПОПАДИ В ЦЕЛЬ")
        .bold()
        .multilineTextAlignment(.center)
        .lineSpacing(4.0)
        .font(.footnote)
        .kerning(2.0)
      Text("89")
        .fontWeight(.black)
        .font(.largeTitle)
        .kerning(-1.0)
      HStack {
        Text("1")
          .bold()
          .kerning(1.5)
        Slider(value: .constant(50),in: 0...100)
        Text("100")
          .bold()
      }
      Button("Проверить") {
        
      }
    }
  }
}
 
#Preview {
  ContentView()
}
