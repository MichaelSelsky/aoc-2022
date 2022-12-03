//
//  Day3.swift
//  AdventOfCode
//

import Foundation
import Algorithms

struct Day3: Day {
    let scores = Array(" abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
    func part1(_ input: String) throws -> CustomStringConvertible {
        let values = input.lines().flatMap { items in
            let items = Array(items)
            let itemsCount = items.count
            let firstHalf = Set(items[0 ..< itemsCount / 2])
            let secondHalf = Set(items[itemsCount / 2 ..< itemsCount])
            return firstHalf.intersection(secondHalf)
        }
        return values.compactMap(scores.firstIndex(of:)).sum
    }
    
    func part2(_ input: String) throws -> CustomStringConvertible {
        let x = input.lines().chunks(ofCount: 3).flatMap { group in
            let elves = group.map(Set.init)
            return elves[0].intersection(elves[1]).intersection(elves[2])
        }
        
        return x.compactMap(scores.firstIndex(of:)).sum
    }
}
