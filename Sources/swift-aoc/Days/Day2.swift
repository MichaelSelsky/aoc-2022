//
//  Day2.swift
//  AdventOfCode
//

import Foundation

struct Day2: Day {
  enum Move: String {
    case rock = "A"
    case paper = "B"
    case scissors = "C"

    init?(rawValue: String) {
      switch rawValue {
      case "A", "X":
        self = .rock
      case "B", "Y":
        self = .paper
      case "C", "Z":
        self = .scissors
      default:
        return nil
      }
    }

    func against(_ otherMove: Move) -> EndCondition {
      switch (self, otherMove) {
      case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
        return .draw
      case (.rock, .scissors), (.scissors, .paper), (.paper, .rock):
        return .win
      case (.scissors, .rock), (.paper, .scissors), (.rock, .paper):
        return .lose
      }
    }

    func myMoveTo(_ endCondition: EndCondition) -> Move {
      switch endCondition {
      case .draw: return self
      case .win:
        switch self {
        case .paper:
          return .scissors
        case .rock:
          return .paper
        case .scissors:
          return .rock
        }
      case .lose:
        switch self {
        case .paper:
          return .rock
        case .rock:
          return .scissors
        case .scissors:
          return .paper
        }
      }
    }

    var moveScore: Int {
      switch self {
      case .rock: return 1
      case .paper: return 2
      case .scissors: return 3
      }
    }
  }
  enum EndCondition: String {
    case lose = "X"
    case draw = "Y"
    case win = "Z"

    var score: Int {
      switch self {

      case .lose:
        return 0
      case .draw:
        return 3
      case .win:
        return 6
      }
    }
  }
  func part1(_ input: String) throws -> CustomStringConvertible {
    input.lines().map { line in
      let game = line.split(separator: " ")
      guard game.count == 2 else {
        print("uhoh")
        return 0
      }
      let myMove = Move(rawValue: String(game.last!))!
      let theirMove = Move(rawValue: String(game.first!))!
      return myMove.against(theirMove).score + myMove.moveScore
    }.reduce(0, +)
  }

  func part2(_ input: String) throws -> CustomStringConvertible {
    input.lines().map { line in
      let game = line.split(separator: " ")
      guard game.count == 2 else {
        print("uhoh")
        return 0
      }
      let endCondition = EndCondition(rawValue: String(game.last!))!
      let theirMove = Move(rawValue: String(game.first!))!
      return endCondition.score + theirMove.myMoveTo(endCondition).moveScore
    }.reduce(0, +)
  }
}
