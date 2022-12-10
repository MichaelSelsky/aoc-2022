//
//  Day9.swift
//  AdventOfCode
//

import Foundation

struct Day9: Day {
    func part1(_ input: String) throws -> CustomStringConvertible {
        let input = input.lines()
        var chain = Array(repeating: Coordinate(x: 0, y: 0), count: 2)
        
        var tailVisited = Set([Coordinate(x: 0, y: 0)])
        input.forEach { s in
            let elems = s.split(separator: " ")
            let move = Move(rawValue: String(elems.first!))!
            let d = Int(String(elems.last!))!
            for _ in 0..<d {
                chain[0].move(move)
                for i in 1..<2 {
                    chain[i].pullTowards(chain[i-1])
                }
                tailVisited.insert(chain.last!)
            }
        }
        
        return tailVisited.count
    }
    
    func part2(_ input: String) throws -> CustomStringConvertible {
        let input = input.lines()
        var chain = Array(repeating: Coordinate(x: 0, y: 0), count: 10)
        
        var tailVisited = Set([Coordinate(x: 0, y: 0)])
        input.forEach { s in
            let elems = s.split(separator: " ")
            let move = Move(rawValue: String(elems.first!))!
            let d = Int(String(elems.last!))!
            for _ in 0..<d {
                chain[0].move(move)
                for i in 1..<10 {
                    chain[i].pullTowards(chain[i-1])
                }
                tailVisited.insert(chain.last!)
            }
        }
        
        return tailVisited.count
    }
    
    struct Coordinate: Hashable {
        var x: Int
        var y: Int
        
        mutating func move(_ m: Move) {
            switch m {
            case .down:
                self.y -= 1
            case .up:
                self.y += 1
            case .left:
                self.x -= 1
            case .right:
               self.x += 1
            }
        }
        
        func distanceTo(_ other: Coordinate) -> Int {
            let xDist = abs(self.x - other.x)
            let yDist = abs(self.y - other.y)
            return max(xDist, yDist)
        }
        
        func moveTowards(_ other: Coordinate) -> Coordinate {
            var newY = self.y
            var newX = self.x
            
            if self.x == other.x {
                newX = self.x
            } else if self.x < other.x {
                newX += 1
            } else {
                newX -= 1
            }
            
            if self.y == other.y {
                newY = self.y
            } else if self.y < other.y {
                newY += 1
            } else {
                newY -= 1
            }
            
            
            return Coordinate(x: newX, y: newY)
        }
        
        mutating func pullTowards(_ other: Coordinate) {
            guard self.distanceTo(other) > 1 else {
                return
            }
            self = self.moveTowards(other)
        }
    }
    
    enum Move: String {
        case up = "U"
        case down = "D"
        case left = "L"
        case right = "R"
    }
}
