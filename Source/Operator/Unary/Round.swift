//
//  Round.swift
//  PlanoutKit
//
//  Created by David Christiandy on 14/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

extension PlanOutOperation {
    /// Rounds a given double value.
    final class Round: PlanOutOpUnary {
        typealias ResultType = Double

        func unaryExecute(_ value: Any) throws -> Double? {
            guard case let Literal.number(numericValue) = Literal(value) else {
                throw OperationError.typeMismatch(expected: "Numeric", got: String(describing: Literal(value)))
            }

            return numericValue.rounded()
        }
    }
}
