//
//  PlanOutOpBinary.swift
//  PlanoutKit
//
//  Created by David Christiandy on 11/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

protocol PlanOutOpBinary: PlanOutOpSimple {
    func binaryExecute(left: Literal, right: Literal) throws -> ResultType?
}

extension PlanOutOpBinary {
    func simpleExecute(_ args: [String: Any], _ context: PlanOutOpContext) throws -> ResultType? {
        // get "left" and "right" argument.
        guard let leftValue = args[PlanOutOperation.Keys.left.rawValue],
            let rightValue = args[PlanOutOperation.Keys.right.rawValue] else {
            throw OperationError.missingArgs(args: "\(PlanOutOperation.Keys.left.rawValue),\(PlanOutOperation.Keys.right.rawValue)",
                                             type: String(describing: Self.self))
        }

        return try binaryExecute(left: Literal(leftValue), right: Literal(rightValue))
    }
}
