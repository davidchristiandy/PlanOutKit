//
//  PlanOutOpComparison.swift
//  PlanoutKit
//
//  Created by David Christiandy on 12/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

protocol PlanOutOpComparison: PlanOutOpBinary where ResultType == Bool {
    func comparisonExecute<T: Comparable>(left: T, right: T) -> Bool
}

extension PlanOutOpComparison {
    func binaryExecute(left: Literal, right: Literal) throws -> Bool? {
        switch (left, right) {
        case (.string(let leftValue), .string(let rightValue)):
            return comparisonExecute(left: leftValue, right: rightValue)

        case (.number(let leftValue), .number(let rightValue)):
            return comparisonExecute(left: leftValue, right: rightValue)

        case (.list(_), .list(_)):
            throw OperationError.typeMismatch(expected: "String or Numeric", got: "Array")

        case (.dictionary(_), .dictionary(_)):
            throw OperationError.typeMismatch(expected: "String or Numeric", got: "Dictionary")

        default:
            throw OperationError.typeMismatch(expected: "left and right having the same type", got: "different types")
        }
    }
}

// MARK: Comparison Operator Implementation

extension PlanOutOperation {

    final class GreaterThan: PlanOutOpComparison {
        func comparisonExecute<T>(left: T, right: T) -> Bool where T : Comparable {
            return left > right
        }
    }

    final class GreaterThanOrEqualTo: PlanOutOpComparison {
        func comparisonExecute<T>(left: T, right: T) -> Bool where T : Comparable {
            return left >= right
        }
    }

    final class LessThan: PlanOutOpComparison {
        func comparisonExecute<T>(left: T, right: T) -> Bool where T : Comparable {
            return left < right
        }
    }

    final class LessThanOrEqualTo: PlanOutOpComparison {
        func comparisonExecute<T>(left: T, right: T) -> Bool where T : Comparable {
            return left <= right
        }
    }

}
