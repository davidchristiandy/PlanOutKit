//
//  LiteralOperation.swift
//  PlanoutKit
//
//  Created by David Christiandy on 14/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

extension PlanOutOperation {
    /// Return value from the given argument.
    final class LiteralOperation: PlanOutOp {
        typealias ResultType = Any

        func execute(_ args: [String : Any], _ context: PlanOutOpContext) throws -> Any? {
            return args[Keys.value.rawValue]
        }
    }
}

