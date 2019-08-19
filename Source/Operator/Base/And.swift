//
//  And.swift
//  PlanoutKit
//
//  Created by David Christiandy on 14/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

extension PlanOutOperation {
    // AND operator for multiple values.
    final class And: PlanOutOp {
        func execute(_ args: [String : Any], _ context: PlanOutOpContext) throws -> Bool? {
            guard let values = args[Keys.values.rawValue] as? [Any] else {
                throw OperationError.missingArgs(args: Keys.values.rawValue, type: self)
            }

            for value in values {
                if !Literal(value).boolValue {
                    return false
                }
            }

            return true
        }
    }
}
