//
//  PlanOutOpSimple.swift
//  PlanoutKit
//
//  Created by David Christiandy on 11/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

/// Evaluates all arguments before the operator is executed.
///
/// Operator will evaluate all arguments recursively through `PlanOutOpContext`, before simpleExecute is called.
protocol PlanOutOpSimple: PlanOutOp {
    func simpleExecute(_ args: [String: Any], _ context: PlanOutOpContext) throws -> ResultType?
}

extension PlanOutOpSimple {
    /// Default implementation that evaluates all provided arguments before calling `simpleExecute`.
    ///
    /// - Parameters:
    ///   - args: Operation arguments
    ///   - context: PlanOut operation context
    /// - Returns: Value from executed operation
    /// - Throws: OperationError
    func execute(_ args: [String: Any], _ context: PlanOutOpContext) throws -> ResultType? {
        // evaluate all arguments first.
        var evaluatedArgs: [String: Any] = [:]
        try args.forEach { key, value in
            evaluatedArgs[key] = try context.evaluate(value)
        }

        return try simpleExecute(evaluatedArgs, context)
    }
}
