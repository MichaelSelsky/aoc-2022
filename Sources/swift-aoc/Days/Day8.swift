//
//  Day8.swift
//  AdventOfCode
//

import Foundation
import Algorithms

struct Day8: Day {
    
    func part1(_ input: String) throws -> CustomStringConvertible {
        let grid = input.lines().map { $0.map { Int(String($0))! }}
        var visible: [[Bool]] = Array(repeating: Array(repeating: false, count: grid.first!.count), count: grid.count)
        for a in grid.indices {
            for b in grid[a].indices {
                if a == grid.indices.first
                    || a == grid.indices.last
                    || b == grid[a].indices.first
                    || b == grid[a].indices.last {
                    visible[a][b] = true
                    continue
                }
                let value = grid[a][b]
                var isVisible = true
                for x in 0..<a {
                    isVisible = grid[x][b] < value && isVisible
                }
                if !isVisible {
                    isVisible = true
                    for x in a+1...grid.indices.last! {
                        isVisible = grid[x][b] < value && isVisible
                    }
                }
                if !isVisible {
                    isVisible = true
                    for y in 0..<b {
                        isVisible = grid[a][y] < value && isVisible
                    }
                }
                if !isVisible {
                    isVisible = true
                    for y in b+1...grid[a].indices.last! {
                        isVisible = grid[a][y] < value && isVisible
                    }
                }


                visible[a][b] = isVisible
            }
        }
        return visible.flatMap( {$0}).count(where: {$0})
    }
    
    func part2(_ input: String) throws -> CustomStringConvertible {
        let grid = input.lines().map { $0.map { Int(String($0))! }}
        let scores = (1..<grid.indices.last!).flatMap { i in
            (1..<grid[i].indices.last!).map { (i, $0) }
        }.map { (x, y) in
            scenicScore(grid: grid, a: x, b: y)
        }
        return scores.max()!
    }
    
    func scenicScore(grid: [[Int]], a: Int, b: Int) -> Int {
        let value = grid[a][b]
        let upDirection = (0..<a).reversed().map { r in
            grid[r][b]
        }
        let downDirection = (a+1..<grid.count).map { r in
            grid[r][b]
        }
        let leftDirection = (0..<b).reversed().map { r in
            grid[a][r]
        }
        let rightDirection = (b+1..<grid[a].count).map { r in
            grid[a][r]
        }
        return [upDirection, leftDirection, rightDirection, downDirection].map { dir -> Int in
            if let t = dir.firstIndex(where: {$0 >= value}) {
                return t + 1
            }
            return dir.count
        }.product
    }
}


