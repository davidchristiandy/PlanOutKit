//
//  Mod.swift
//  PlanoutKit
//
//  Created by David Christiandy on 14/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

extension PlanOutOperation {
    // Modulo operation
    final class Mod: PlanOutOpBinary {
        typealias ResultType = Double

        func binaryExecute(left: Literal, right: Literal) throws -> Double? {
            guard case let (Literal.number(leftNumber), Literal.number(rightNumber)) = (left, right) else {
                throw OperationError.typeMismatch(expected: "Numeric", got: "\(String(describing: left)) and \(String(describing: right))")
            }

            return leftNumber.truncatingRemainder(dividingBy: rightNumber)
        }
    }
}
