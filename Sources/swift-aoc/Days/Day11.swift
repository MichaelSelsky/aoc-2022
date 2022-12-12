//
//  Day11.swift
//  AdventOfCode
//

import Foundation

class Monkey {
    var values: [Int]
    let operation: (Int) -> Int
    let test: Int
    var truePass: Monkey!
    var falsePass: Monkey!
    var inspections = 0
    
    init(values: [Int], operation: @escaping (Int) -> Int, test: Int, truePass: Monkey? = nil, falsePass: Monkey? = nil) {
        self.values = values
        self.operation = operation
        self.test = test
        self.truePass = truePass
        self.falsePass = falsePass
    }
    
    func setPassers(t: Monkey, f: Monkey) {
        truePass = t
        falsePass = f
    }
    
    func processItems() {
        values.forEach(processItem(_:))
        inspections += values.count
        values = []
    }
    
    func processItems2(max: Int) {
        values.forEach { processItem2($0, n: max) }
        inspections += values.count
        values = []
    }
    
    func processItem(_ value: Int) {
        let newValue = operation(value) / 3
        if newValue % test == 0 {
            truePass.revieveItem(newValue)
        } else {
            falsePass.revieveItem(newValue)
        }
    }
    
    func processItem2(_ value: Int, n: Int) {
        let newValue = operation(value) % n
        if newValue % test == 0 {
            truePass.revieveItem(newValue)
        } else {
            falsePass.revieveItem(newValue)
        }
    }
    
    func revieveItem(_ value: Int) {
        values.append(value)
    }
    
}

struct Day11: Day {
    func parsedInput() -> ([Monkey], Int) {
        let m0 = Monkey(values: [64, 89, 65, 95],
                        operation: { $0 * 7 },
                        test: 3 )
        let m1 = Monkey(values: [76, 66, 74, 87, 70, 56, 51, 66],
                        operation: { $0 + 5 },
                        test: 13)
        let m2 = Monkey(values: [91, 60, 63],
                        operation: { $0 * $0 },
                        test: 2 )
        let m3 = Monkey(values: [92, 61, 79, 97, 79],
                        operation: { $0 + 6 },
                        test: 11 )
        let m4 = Monkey(values: [93, 54],
                        operation: { $0 * 11 },
                        test: 5)
        let m5 = Monkey(values: [60, 79, 92, 69, 88, 82, 70],
                        operation: { $0 + 8 },
                        test: 17)
        let m6 = Monkey(values: [64, 57, 73, 89, 55, 53],
                        operation: { $0 + 1 },
                        test: 19)
        let m7 = Monkey(values: [62],
                        operation: { $0 + 4 },
                        test: 7)
        m0.setPassers(t: m4, f: m1)
        m1.setPassers(t: m7, f: m3)
        m2.setPassers(t: m6, f: m5)
        m3.setPassers(t: m2, f: m6)
        m4.setPassers(t: m1, f: m7)
        m5.setPassers(t: m4, f: m0)
        m6.setPassers(t: m0, f: m5)
        m7.setPassers(t: m3, f: m2)
        let monkeys = [m0, m1, m2, m3, m4, m5, m6, m7]
        let n = monkeys.map(\.test).product
        return (monkeys, n)
    }
    
    func testInput() -> ([Monkey], Int) {
        let m0 = Monkey(values: [79, 98],
                        operation: { $0 * 19 },
                        test: 23 )
        let m1 = Monkey(values: [54, 65, 75, 74],
                        operation: { $0 + 6 },
                        test: 19)
        let m2 = Monkey(values: [79, 60, 97],
                        operation: { $0 * $0 },
                        test: 13 )
        let m3 = Monkey(values: [74],
                        operation: { $0 + 3 },
                        test: 17 )
        
        m0.setPassers(t: m2, f: m3)
        m1.setPassers(t: m2, f: m0)
        m2.setPassers(t: m1, f: m3)
        m3.setPassers(t: m0, f: m1)
        let monkeys = [m0, m1, m2, m3]
        let n = monkeys.map(\.test).product
        return (monkeys, n)
    }
    
    func part1(_ input: String) throws -> CustomStringConvertible {
        return ""
        let (parsedInput, _) = parsedInput()
        for _ in 0..<20 {
            parsedInput.forEach { $0.processItems() }
        }
        return parsedInput.max(count: 2, sortedBy: { $0.inspections < $1.inspections }).map(\.inspections).product
    }
    
    func part2(_ input: String) throws -> CustomStringConvertible {
        let (parsedInput, n) = parsedInput()
        for i in 0 ..< 10000 {
            parsedInput.forEach { $0.processItems2(max: n) }
        }
        return parsedInput.max(count: 2, sortedBy: { $0.inspections < $1.inspections }).map(\.inspections).product
    }
}
