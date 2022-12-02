//
//  File.swift
//
//
//  Created by Michael Selsky on 11/30/22.
//

import Foundation

extension String {
  func lines(includeEmpties: Bool = false) -> [Substring] {
    self.split(separator: "\n", omittingEmptySubsequences: !includeEmpties)
  }
}
