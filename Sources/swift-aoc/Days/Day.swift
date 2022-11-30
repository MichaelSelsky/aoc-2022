//
//  Day.swift
//  
//
//  Created by Michael Selsky on 11/29/22.
//

protocol Day {
    func part1(_ input: String) throws -> CustomStringConvertible
    func part2(_ input: String) throws -> CustomStringConvertible
}

enum Days: Int, Codable {
    case day1 = 1,
         day2,
         day3,
         day4,
         day5,
         day6,
         day7,
         day8,
         day9,
         day10,
         day11,
         day12,
         day13,
         day14,
         day15,
         day16,
         day17,
         day18,
         day19,
         day20,
         day21,
         day22,
         day23,
         day24,
         day25
    
    var executable: Day? {
        switch self {
        case .day1:
            return Day1()
        default: return nil
//        case .day2:
//            <#code#>
//        case .day3:
//            <#code#>
//        case .day4:
//            <#code#>
//        case .day5:
//            <#code#>
//        case .day6:
//            <#code#>
//        case .day7:
//            <#code#>
//        case .day8:
//            <#code#>
//        case .day9:
//            <#code#>
//        case .day10:
//            <#code#>
//        case .day11:
//            <#code#>
//        case .day12:
//            <#code#>
//        case .day13:
//            <#code#>
//        case .day14:
//            <#code#>
//        case .day15:
//            <#code#>
//        case .day16:
//            <#code#>
//        case .day17:
//            <#code#>
//        case .day18:
//            <#code#>
//        case .day19:
//            <#code#>
//        case .day20:
//            <#code#>
//        case .day21:
//            <#code#>
//        case .day22:
//            <#code#>
//        case .day23:
//            <#code#>
//        case .day24:
//            <#code#>
//        case .day25:
//            <#code#>
        }
    }
}
