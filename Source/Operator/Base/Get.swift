//
//  Get.swift
//  PlanoutKit
//
//  Created by David Christiandy on 14/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

import Foundation

extension PlanOutOperation {
    /// Obtain values from the provided context.
    final class Get: PlanOutOp {
        func execute(_ args: [String: Any], _ context: PlanOutOpContext) throws -> Any? {
            guard let optionalValue = args[Keys.variable.rawValue], let value = optionalValue else {
                throw OperationError.missingArgs(args: "var", type: self)
            }

            guard let varName = value as? String else {
                return nil
            }

            return try context.get(varName)
        }
    }
}
