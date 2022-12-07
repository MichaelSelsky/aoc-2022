//
//  Day6.swift
//  AdventOfCode
//

import Foundation

struct Day6: Day {
    
    func part1(_ input: String) throws -> CustomStringConvertible {
        findStartOf(input: input, length: 4)
    }
    
    func part2(_ input: String) throws -> CustomStringConvertible {
        findStartOf(input: input, length: 14)
    }
    
    func findStartOf(input: String, length: Int) -> Int {
        let windows = input.windows(ofCount: length)
        var idx = length
        for window in windows {
            if Set(window).count == window.count {
                return idx
            }
            idx += 1
        }
        return 0
    }
}
