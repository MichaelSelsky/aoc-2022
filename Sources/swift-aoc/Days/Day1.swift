//
//  Day1.swift
//
//
//  Created by Michael Selsky on 11/29/22.
//

import Algorithms
import Foundation

class Day1: Day {
  func part1(_ input: String) throws -> CustomStringConvertible {
    let calCount = input.lines().reduce(([Int](), 0)) { partialResult, line in
      if line.isEmpty {
        return (partialResult.0 + [partialResult.1], 0)
      }
      return (partialResult.0, partialResult.1 + Int(line)!)
    }
    return calCount.0.max()!
  }

  func part2(_ input: String) throws -> CustomStringConvertible {

    let calCount = input.lines().reduce(([Int](), 0)) { partialResult, line in
      if line.isEmpty {
        return (partialResult.0 + [partialResult.1], 0)
      }
      return (partialResult.0, partialResult.1 + Int(line)!)
    }
    return calCount.0.sorted(by: >).prefix(3).sum
  }
}
