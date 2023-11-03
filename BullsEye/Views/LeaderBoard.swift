//
//  LeaderBoard.swift
//  BullsEye
//
//  Created by Павел Николаев on 03.11.2023.
//

import SwiftUI

struct LeaderBoard: View {
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .ignoresSafeArea(edges: .all)
      VStack(spacing: 10) {
        HeaderView()
        LabelView()
        RowView(index: 1, score: 459, date: Date())
      }
    }
  }
}



struct RowView: View {
  let index: Int
  let score: Int
  let date: Date
  var body: some View {
    HStack {
      RoundedTextView(text: String(index))
      Spacer()
      ScoreTextView(score: score)
        .frame(width: Constants.LeaderBoard.leaderboardScoreColWidth)
      Spacer()
      DateTextView(date: date)
        .frame(width: Constants.LeaderBoard.leaderboardDateColWidth)
      
    }
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
      )
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.LeaderBoard.leaderboardMaxRowWidth)
  }
}

struct HeaderView: View {
  var body: some View {
    ZStack {
      BigBoldText(text: "Топ игроков")
      HStack {
        Spacer()
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
          RoundedImageViewFilled(systemName: "xmark")
            .padding(.trailing)
        }
      }
    }
  }
}

struct LabelView: View {
  var body: some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      LabelText(label: "Очки")
        .frame(width: Constants.LeaderBoard.leaderboardScoreColWidth)
      Spacer()
      LabelText(label: "Дата")
        .frame(width: Constants.LeaderBoard.leaderboardDateColWidth)
    }
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.LeaderBoard.leaderboardMaxRowWidth)
  }
}

struct LeaderBoard_Previews: PreviewProvider {
  static var previews: some View {
    LeaderBoard()
    LeaderBoard()
      .previewLayout(.fixed(width: 568, height: 320))
    LeaderBoard()
      .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    LeaderBoard()
      .previewLayout(.fixed(width: 568, height: 320))
      .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
  }
}
