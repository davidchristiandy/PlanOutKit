//
//  Set.swift
//  PlanoutKit
//
//  Created by David Christiandy on 14/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

extension PlanOutOperation {
    /// Assign value to the provided context.
    final class Set: PlanOutOp {
        @discardableResult
        func execute(_ args: [String : Any?], _ context: PlanOutOpContext) throws -> Any? {
            guard let optionalVariableName = args[Keys.variable.rawValue],
                let variableName = optionalVariableName as? String else {
                throw OperationError.missingArgs(args: Keys.variable.rawValue, type: self)
            }

            guard let optionalValue = args[Keys.value.rawValue], let value = optionalValue else {
                throw OperationError.missingArgs(args: Keys.value.rawValue, type: self)
            }

            if let evaluatedValue = try context.evaluate(value) {
                try context.set(variableName, value: evaluatedValue)
            }
            
            return nil
        }
    }
}
