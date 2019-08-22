//
//  PlanOutOp.swift
//  PlanoutKit
//
//  Created by David Christiandy on 30/07/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

/// General type-erased protocol for operators.
///
/// The protocol is used for dynamically-generated operators via Operator class; however, it generalizes the return type to Any. This means, the caller should either be aware of what return type it is expecting, or it shouldn't care at all.
protocol PlanOutExecutable {
    var isRandomOperator: Bool { get }
    func executeOp(args: [String: Any?], context: PlanOutOpContext) throws -> Any?
}

// MARK: Base PlanOut operation

protocol PlanOutOp: PlanOutExecutable {
    associatedtype ResultType

    func execute(_ args: [String: Any?], _ context: PlanOutOpContext) throws -> ResultType?
}

extension PlanOutOp {
    var isRandomOperator: Bool {
        return false
    }

    func executeOp(args: [String: Any?], context: PlanOutOpContext) throws -> Any? {
        return try execute(args, context)
    }
}
