//
//  SharedBehavior.swift
//  PlanOutKitTests
//
//  Created by David Christiandy on 18/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

import Quick

enum SharedBehavior: String {
    case simpleOperator = "PlanOut simple operator"
    case unaryOperator = "PlanOut unary operator"
    case commutativeOperator = "PlanOut commutative operator"
    case binaryOperator = "PlanOut binary operator"
    case comparisonOperator = "PlanOut comparison operator"
    case randomOperator = "PlanOut random operator"
    case numericOperator = "Numeric operator"

    enum Keys: String {
        case op
        case argKeys
    }
}

// convenience function
func itBehavesLike(_ behavior: SharedBehavior, file: FileString = #file, line: UInt = #line, context: @escaping () -> [SharedBehavior.Keys: Any]) {
    itBehavesLike(behavior.rawValue, file: file, line: line) { () -> [String : Any] in
        // map [SharedBehavior: Any] to [String: Any].
        var transformed: [String: Any] = [:]
        context().forEach { transformed[$0.key.rawValue] = $0.value }

        return transformed
    }
}
