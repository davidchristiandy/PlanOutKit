//
//  Equals.swift
//  PlanoutKit
//
//  Created by David Christiandy on 14/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

extension PlanOutOperation {
    // Check equality between two literal types.
    final class Equals: PlanOutOpBinary {
        typealias ResultType = Bool

        func binaryExecute(left: Literal, right: Literal) throws -> Bool? {
            return left == right
        }
    }
}
