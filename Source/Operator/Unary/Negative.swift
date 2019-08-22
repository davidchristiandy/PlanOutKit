//
//  Negative.swift
//  PlanoutKit
//
//  Created by David Christiandy on 14/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

extension PlanOutOperation {
    /// Turns the given value into negative, or vice versa.
    final class Negative: PlanOutOpUnary {
        typealias ResultType = Double
        
        func unaryExecute(_ value: Any?) throws -> Double? {
            guard let concreteValue = value, case let Literal.number(numericValue) = Literal(concreteValue) else {
                throw OperationError.typeMismatch(expected: "Numeric", got: String(describing: value))
            }

            return 0 - numericValue
        }
    }
}
