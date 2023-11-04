import SwiftUI

struct BackgroundView: View {
  
  @Binding var game: Game
  
  var body: some View {
    VStack {
      TopView(game: $game)
      Spacer()
      BottomView(game: $game)
    }
    .padding()
    .background(
      RingsView()
    )
    
  }
}

struct TopView: View {
  
  @Binding var game: Game
  
  @State private var leaderboardIsShowing = false
  
  var body: some View {
    HStack {
      Button(action: {
        game.restart()
      },
             label: {
        RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      })
      
      //      RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      Spacer()
      Button(action: {
        leaderboardIsShowing.toggle()
      },
             label: {
        RoundedImageViewFilled(systemName: "list.dash")
      })
      .sheet(isPresented: $leaderboardIsShowing, content: {
        LeaderBoard(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
      })
    }
  }
}

struct NumberView: View {
  var title: String
  var text: String
  var body: some View {
    VStack(spacing: 5) {
      LabelText(label: title)
      RoundedRectTextView(text: text)
    }
    
  }
}

struct BottomView: View {
  
  @Binding var game: Game
  
  var body: some View {
    
    
    HStack {
      NumberView(title: "Очки", text: String(game.score))
      Spacer()
      NumberView(title: "Раунд", text: String(game.currentRound))
    }
  }
}

struct RingsView: View {
  
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      
      ForEach(1..<6) { ring in
        let size = CGFloat(ring) * 100
        let opacity = colorScheme == .dark ? 0.1 : 0.3
        Circle()
        //          .strokeBorder(Color("RingsColor"), lineWidth: 20)
        
          .stroke(lineWidth: 20)
          .fill(RadialGradient(gradient: Gradient(colors: [ Color("RingsColor").opacity(opacity), Color("RingsColor").opacity(0)]), center: .center, startRadius: 100, endRadius: 300))
          .frame(width: size, height: size)
          .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
      }
      //      RadialGradient(gradient: Gradient(colors: [ Color("RingsColor").opacity(0.32), Color.white.opacity(0)]), center: .center, startRadius: 100, endRadius: 300)
      
    }
  }
}

struct BackgroundView_PreviewView: PreviewProvider {
  static var previews: some View {
    BackgroundView(game: .constant(Game()))
  }
}
