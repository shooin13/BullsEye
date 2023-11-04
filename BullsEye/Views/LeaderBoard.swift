//
//  LeaderBoard.swift
//  BullsEye
//
//  Created by Павел Николаев on 03.11.2023.
//

import SwiftUI

struct LeaderBoard: View {
  
  @Binding var leaderboardIsShowing: Bool
  @Binding var game: Game
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .ignoresSafeArea(edges: .all)
      VStack(spacing: 10) {
        HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
        LabelView()
        ScrollView {
          VStack(spacing: 10) {
            ForEach(game.leaderboardEntries.indices) {
              i in
              let leaderboardEntry = game.leaderboardEntries[i]
              RowView(index: i+1, score: leaderboardEntry.score, date: leaderboardEntry.date)
            }
          }
        }
      }
      .padding(.top)
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
  
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  
  @Binding var leaderboardIsShowing: Bool
  
  var body: some View {
    ZStack {
      HStack {
        if verticalSizeClass == .regular && horizontalSizeClass == .compact {
          BigBoldText(text: "Очки")
            .padding(.leading)
          Spacer()
        } else {
          BigBoldText(text: "Очки")
        }
      }
      HStack {
        Spacer()
        Button(action: {
          leaderboardIsShowing.toggle()
        }) {
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
  static private var leaderboardIsShowing = Binding.constant(false)
  static private var game = Binding.constant(Game(loadTestData: true))
  static var previews: some View {
    LeaderBoard(leaderboardIsShowing: leaderboardIsShowing, game: game)
    LeaderBoard(leaderboardIsShowing: leaderboardIsShowing, game: game)
      .previewLayout(.fixed(width: 568, height: 320))
    LeaderBoard(leaderboardIsShowing: leaderboardIsShowing, game: game)
      .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    LeaderBoard(leaderboardIsShowing: leaderboardIsShowing, game: game)
      .previewLayout(.fixed(width: 568, height: 320))
      .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
  }
}
