//
//  Day.swift
//
//
//  Created by Michael Selsky on 11/29/22.
//

protocol Day {
  func part1(_ input: String) throws -> CustomStringConvertible
  func part2(_ input: String) throws -> CustomStringConvertible
}

enum Days: Int, Codable {
  case day1 = 1
  case
    day2,
    day3,
    day4,
    day5,
    day6,
    day7,
    day8,
    day9,
    day10,
    day11,
    day12,
    day13,
    day14,
    day15,
    day16,
    day17,
    day18,
    day19,
    day20,
    day21,
    day22,
    day23,
    day24,
    day25

  var executable: Day? {
    switch self {
    case .day1:
      return Day1()
    case .day2:
      return Day2()
    case .day3:
      return Day3()
    case .day4:
      return Day4()
    case .day5:
      return Day5()
    case .day6:
      return Day6()
    case .day7:
      return Day7()
    case .day8:
      return Day8()
    case .day9:
      return Day9()
    case .day10:
      return Day10()
    case .day11:
      return Day11()
    case .day12:
      return Day12()
    case .day13:
      return Day13()
    case .day14:
      return Day14()
    case .day15:
      return Day15()
    case .day16:
      return Day16()
    case .day17:
      return Day17()
    case .day18:
      return Day18()
    case .day19:
      return Day19()
    case .day20:
      return Day20()
    case .day21:
      return Day21()
    case .day22:
      return Day22()
    case .day23:
      return Day23()
    case .day24:
      return Day24()
    case .day25:
      return Day25()
    }
  }
}
