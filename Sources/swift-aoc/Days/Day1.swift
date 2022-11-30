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
        input.split(separator: "\n").compactMap { Int($0) }.adjacentPairs().count { $0 < $1 }
    }
    
    func part2(_ input: String) throws -> CustomStringConvertible {
        throw NotImplementedError()
    }
}
