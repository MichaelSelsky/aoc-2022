//
//  Day4.swift
//  AdventOfCode
//

import Foundation

struct Day4: Day {
  func part1(_ input: String) throws -> CustomStringConvertible {
      input.lines().map { line in
          let ranges = line.split(separator: ",").map { range in
              let values = range.split(separator: "-")
              let (start, end) = (values.first!, values.last!)
              return Int(start)! ... Int(end)!
          }
          return ranges.first?.clamped(to: ranges.last!) == ranges.first || ranges.last?.clamped(to: ranges.first!) == ranges.last
      }.count(where: { $0 })
  }

  func part2(_ input: String) throws -> CustomStringConvertible {
      input.lines().map { line in
          let ranges = line.split(separator: ",").map { range in
              let values = range.split(separator: "-")
              let (start, end) = (values.first!, values.last!)
              return Int(start)! ... Int(end)!
          }
          return ranges.first?.overlaps(ranges.last!) ?? false
      }.count(where: { $0 })
  }
}
