import Foundation

struct LeaderBoardEntry {
  let score: Int
  let date: Date
}

struct Game {
  var target = Int.random(in: 1...100)
  var score = 0
  var currentRound = 1
  var leaderboardEntries: [LeaderBoardEntry] = []
  
  init(loadTestData: Bool = false) {
    if loadTestData {
      leaderboardEntries.append(LeaderBoardEntry(score: 100, date: Date()))
      leaderboardEntries.append(LeaderBoardEntry(score: 80, date: Date()))
      leaderboardEntries.append(LeaderBoardEntry(score: 250, date: Date()))
      leaderboardEntries.append(LeaderBoardEntry(score: 459, date: Date()))
      leaderboardEntries.append(LeaderBoardEntry(score: 1, date: Date()))
    }
  }
  
  func points(sliderValue: Int) -> Int {
    let bonusPoints: Int
    let difference = abs(target - sliderValue)
    
    
    if difference == 0 {
      bonusPoints = 100
    } else if difference <= 2 {
      bonusPoints = 50
    } else {
      bonusPoints = 0
    }
    return 100 - difference + bonusPoints
  }
  
  mutating func startNewRound(points: Int) {
    target = Int.random(in: 1...100)
    currentRound += 1
    score += points
    addToLeaderBoard(points: points)
  }
  
  mutating func addToLeaderBoard(points: Int) {
    leaderboardEntries.append(LeaderBoardEntry(score: points, date: Date()))
    leaderboardEntries.sort(by: {$0.score > $1.score})
  }
  
  mutating func restart() {
    target = Int.random(in: 1...100)
    currentRound = 1
    score = 0
  }
}
