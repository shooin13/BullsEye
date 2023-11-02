import Foundation

struct Game {
  var target = Int.random(in: 1...100)
  var score = 0
  var currentRound = 1
  
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
  }
  
  mutating func restart() {
    target = Int.random(in: 1...100)
    currentRound = 1
    score = 0
  }
}
