//
//  Index.swift
//  PlanoutKit
//
//  Created by David Christiandy on 14/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

extension PlanOutOperation {
    /// returns value at index if it exists, or return nil otherwise.
    /// works with both lists and dictionaries.
    final class Index: PlanOutOpSimple {
        typealias ResultType = Any

        func simpleExecute(_ args: [String : Any?], _ context: PlanOutOpContext) throws -> Any? {
            guard let optionalBaseValue = args[Keys.base.rawValue], let baseValue = optionalBaseValue else {
                throw OperationError.missingArgs(args: Keys.base.rawValue, type: String(describing: self))
            }

            guard let optionalIndexValue = args[Keys.index.rawValue], let indexValue = optionalIndexValue else {
                throw OperationError.missingArgs(args: Keys.index.rawValue, type: String(describing: self))
            }

            switch Literal(baseValue) {
            // For list types, the index has to be an Int, and it must be within the array's index range.
            case .list(let arrayValue):
                guard let numericIndex = indexValue as? Int, case (0..<arrayValue.count) = numericIndex else {
                    return nil
                }
                return arrayValue[numericIndex]

            // In PlanOut the key has to be String.
            case .dictionary(let dictionaryValue):
                guard let index = indexValue as? String, let optionalValue = dictionaryValue[index] else {
                    return nil
                }
                return optionalValue

            default:
                throw OperationError.typeMismatch(expected: "base value to be Array or Dictionary", got: String(describing: self))
            }
        }
    }
    
}
