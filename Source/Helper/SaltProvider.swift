//
//  File.swift
//  PlanoutKit
//
//  Created by David Christiandy on 29/07/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

import Foundation

struct SaltProvider {
    static let defaultSeparator: String = "."

    static func generate(values: [String], separator: String = defaultSeparator) -> String {
        return values.filter { !$0.isEmpty }.joined(separator: separator)
    }
}
