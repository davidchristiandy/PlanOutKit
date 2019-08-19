//
//  Condition.swift
//  PlanoutKit
//
//  Created by David Christiandy on 14/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

extension PlanOutOperation {
    /// Simple if-then operation. `then` value is returned if the `if` value evaluates to true.
    final class Condition: PlanOutOp {
        func execute(_ args: [String : Any], _ context: PlanOutOpContext) throws -> Any? {
            guard let ifValue = args[Keys.ifCondition.rawValue],
                let thenValue = args[Keys.thenCondition.rawValue] else {
                    throw OperationError.missingArgs(args: "\(Keys.ifCondition.rawValue), \(Keys.thenCondition.rawValue)", type: self)
            }

            if let evaluatedIfValue = try context.evaluate(ifValue), Literal(evaluatedIfValue).boolValue {
                return try context.evaluate(thenValue)
            }

            return nil
        }
    }
}
