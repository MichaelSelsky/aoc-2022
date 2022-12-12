//
//  Day12.swift
//  AdventOfCode
//

import Foundation

struct Key: Hashable {
    let x: Int
    let y: Int
    
    var neighborKeys: [Key] {
        return [(-1, 0), (1, 0), (0, -1), (0, 1)]
            .map { Key(x: self.x+$0.0, y: self.y+$0.1) }
    }
}

struct Vertex: Hashable, Equatable {
    enum VertexType {
        case start, end, node
    }
    let height: Int
    let index: Key
    let type: VertexType
    
    func neighborsInGraph(_ graph: [Key: Vertex]) -> [Vertex] {
        let neighborKeys = index.neighborKeys
        return neighborKeys.compactMap { graph[$0] }.filter { otherVertex in
            self.height <= otherVertex.height + 1
        }
    }
}

let elevationKey = Array("abcdefghijklmnopqrstuvwxyz")

func parseInput(_ input: String) -> [Key: Vertex] {
    let grid = input.lines().map(Array.init)
    let vertexes = grid.enumerated().flatMap { (idx, row) -> [Vertex] in
        try! row.enumerated().map { (i, val) -> Vertex in
            if let height = elevationKey.firstIndex(of: val) {
                return Vertex(height: height,
                              index: Key(x: idx, y: i),
                              type: .node)
            } else if val == "S" {
                return Vertex(height: 0,
                              index: Key(x: idx, y: i),
                              type: .start)
            } else if val == "E" {
                return Vertex(height: elevationKey.count - 1,
                              index: Key(x: idx, y: i),
                              type: .end)
            } else {
                throw NotImplementedError()
            }
        }
    }
    return Dictionary(uniqueKeysWithValues: vertexes.map { ($0.index, $0) })
}

struct PathfindingResult {
    let previous: [Vertex: Vertex]
    let distance: [Vertex: Int]
}

struct Day12: Day {
    func part1(_ input: String) throws -> CustomStringConvertible {
        let graph = parseInput(input)
        let startNode = graph.values.first(where: { $0.type == .start })!
        let endNode = graph.values.first(where: { $0.type == .end })!
        let bfs = bfs(from: endNode, graph: graph)
        return bfs.distance[startNode]!
    }
    
    func part2(_ input: String) throws -> CustomStringConvertible {
        let graph = parseInput(input)
        let bottomNodes = graph.values.filter({ $0.height == 0 })
        let endNode = graph.values.first(where: { $0.type == .end })!
        let startNode = graph.values.first(where: { $0.type == .start })!
        let distances = bfs(from: endNode, graph: graph)
        return bottomNodes.compactMap { distances.distance[$0] }.min()!
    }
}

func bfs(from source: Vertex, graph: [Key: Vertex]) -> PathfindingResult {
    var distance = [Vertex: Int]()
    var prev = [Vertex: Vertex]()
    var queue = Set<Vertex>([source])
    var visited = Set<Vertex>()
    var c = 0
    distance[source] = 0
    
    while !queue.isEmpty {
        c += 1
        let vertex = queue.min(by: { (distance[$0]!) < (distance[$1]!) })!
        queue.remove(vertex)
        visited.insert(vertex)
        for neighbor in vertex.neighborsInGraph(graph) {
            let alt = distance[vertex]! + 1
            if alt < distance[neighbor] ?? .max {
                distance[neighbor] = alt
                prev[neighbor] = vertex
            }
            if !visited.contains(neighbor) {
                queue.insert(neighbor)
            }
        }
    }
    return PathfindingResult(previous: prev, distance: distance)
}
