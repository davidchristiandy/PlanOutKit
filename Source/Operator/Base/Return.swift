//
//  Return.swift
//  PlanoutKit
//
//  Created by David Christiandy on 14/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

extension PlanOutOperation {
    /// Throws an exception / immediate return.
    final class Return: PlanOutOp {
        func execute(_ args: [String : Any], _ context: PlanOutOpContext) throws -> Any? {
            var shouldLogExposure: Bool = false

            if let value = args[Keys.value.rawValue],
                let evaluatedValue = try context.evaluate(value) {
                shouldLogExposure = Literal(evaluatedValue).boolValue
            }

            throw OperationError.stop(shouldLogExposure)
        }
    }
}
