//
//  Day5.swift
//  AdventOfCode
//

import Foundation

struct Day5: Day {
    func part1(_ input: String) throws -> CustomStringConvertible {
        let stackEndIndex = input.firstIndex(of: "m")!
        let stackDescription = input.prefix(upTo: stackEndIndex).trimmingCharacters(in: .newlines).lines().map(String.init)
        let instructions = String(input.suffix(from: stackEndIndex)).lines()
        let parsedInstructions = parseInstructions(instructions)
        var stacks = parseStacks(stackDescription: stackDescription)
        for instruction in parsedInstructions {
            guard var s = stacks[instruction.1], var t = stacks[instruction.2] else { continue }
            for _ in 0..<instruction.0 {
                if let value = s.popLast() {
                    t.append(value)
                }
            }
            stacks[instruction.1] = s
            stacks[instruction.2] = t
        }
        return stacks.sorted(by: { $0.key < $1.key }).compactMap { $0.value.last }.joined()
    }
    
    func part2(_ input: String) throws -> CustomStringConvertible {
        let stackEndIndex = input.firstIndex(of: "m")!
        let stackDescription = input.prefix(upTo: stackEndIndex).trimmingCharacters(in: .newlines).lines().map(String.init)
        let instructions = String(input.suffix(from: stackEndIndex)).lines()
        let parsedInstructions = parseInstructions(instructions)
        var stacks = parseStacks(stackDescription: stackDescription, reverseStacks: false)
        for instruction in parsedInstructions {
            guard var s = stacks[instruction.1], var t = stacks[instruction.2] else { continue }
            let value = s.prefix(instruction.0)
            t.insert(contentsOf: value, at: 0)
            
            s = Array(s.suffix(from: instruction.0))
            stacks[instruction.1] = s
            stacks[instruction.2] = t
        }
        return stacks.sorted(by: { $0.key < $1.key }).compactMap { $0.value.first }.joined()
    }
    
    func parseStacks(stackDescription: [String], reverseStacks: Bool = true) -> [Int: [String]] {
        let stackNumberLine = stackDescription.last!
        var stacks: [Int: [String]] = [:]
        for n in stackNumberLine {
            if let i = Int(String(n)) {
                let idx = stackNumberLine.firstIndex(of: n)
                var s = stackDescription.prefix(stackDescription.count - 1).compactMap { line -> String? in
                    guard let newIdx = idx?.samePosition(in: line), line[newIdx] != " " else { return nil }
                    return String(line[newIdx])
                }
                if reverseStacks {
                    s = s.reversed()
                }
                stacks[i] = Array(s)
            }
        }
        return stacks
    }
    
    func parseInstructions(_ instructions: [Substring]) -> [(Int, Int, Int)] {
        instructions.map { line -> (Int, Int, Int) in
            let parts = line.split(separator: " ")
            return (Int(parts[1])!, Int(parts[3])!, Int(parts[5])!)
        }
    }
}
