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
        func execute(_ args: [String : Any?], _ context: PlanOutOpContext) throws -> Any? {
            // return nil immediately when the if condition does not exist in the first place.
            guard let optionalIfValue = args[Keys.ifCondition.rawValue] else {
                return nil
            }

            // only evaluate the `then` value if:
            // - the `if` value can be evaluated, nonnull, and has bool value that equals to true.
            if let optionalThenValue = args[Keys.thenCondition.rawValue],
                let evaluatedIfValue = try context.evaluate(optionalIfValue),
                Literal(evaluatedIfValue).boolValue == true {

                return try context.evaluate(optionalThenValue)
            }

            // otherwise, return nil for other cases.
            return nil
        }
    }
}
