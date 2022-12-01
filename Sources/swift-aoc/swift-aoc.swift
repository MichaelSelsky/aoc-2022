import ArgumentParser
import Foundation

@main
struct Advent: ParsableCommand {
  @Option(name: .shortAndLong, help: "The Day whose code should be run")
  var day: Int?

  @Option(name: .shortAndLong, help: "Path to input file")
  var path: String

  func run() throws {
      print(FileManager.default.currentDirectoryPath)
      print(path)
    if let day {
      try run(dayNumber: day, inputPath: path)
    } else {
        for i in (1...25) {
        try run(dayNumber: i, inputPath: path)
      }
    }
  }

  func run(dayNumber: Int, inputPath: String) throws {

    guard let day = Days(rawValue: dayNumber)?.executable else {
      throw NotImplementedError()
    }
    print(day)

    let input = try String(contentsOfFile: "\(inputPath)/day\(dayNumber).txt")

    print("==== Day \(dayNumber) ====")
    let part1StartDate = Date()
    let part1 = try day.part1(input)
    print("Part 1 (\(-part1StartDate.timeIntervalSinceNow * 1000) ms): \(part1)")

    let part2StartDate = Date()
    let part2 = try day.part2(input)
    print("Part 2 (\(-part2StartDate.timeIntervalSinceNow * 1000) ms): \(part2)")
  }
}
