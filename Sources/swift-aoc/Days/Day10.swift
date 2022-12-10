//
//  Day10.swift
//  AdventOfCode
//

import Foundation

struct Day10: Day {
    
    func part1(_ input: String) throws -> CustomStringConvertible {
        var register: Int = 1
        let measureClocks = [20, 60, 100, 140, 180, 220]
        var signalStrengths: [Int] = []
        var clock: Int = 0 {
            didSet {
                if measureClocks.contains(clock) {
                    signalStrengths.append(register * clock)
                }
            }
        }
        for line in input.lines() {
            let commands = line.split(separator: " ")
            switch commands.first! {
            case "noop":
                clock += 1
            case "addx":
                let val = Int(String(commands[1]))!
                clock += 1
                clock += 1
                register += val
            default:
                continue
            }
        }
        
        return signalStrengths.sum
    }
    
    func part2(_ input: String) throws -> CustomStringConvertible {
        var register: Int = 1
        let measureClocks = [20, 60, 100, 140, 180, 220]
        var signalStrengths: [Int] = []
        var display = ""
        var clock: Int = -1 {
            didSet {
                let pos = clock % 40
                if pos == 0 {
                    display.append("\n")
                }
                if (register - 1 ... register + 1).contains(pos) {
                    display.append("#")
                } else {
                    display.append(".")
                }
            }
        }
        for line in input.lines() {
            let commands = line.split(separator: " ")
            switch commands.first! {
            case "noop":
                clock += 1
            case "addx":
                let val = Int(String(commands[1]))!
                clock += 1
                clock += 1
                register += val
            default:
                continue
            }
        }
        return "\n" + display
    }
}
