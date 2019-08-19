//
//  UniformChoice.swift
//  PlanoutKit
//
//  Created by David Christiandy on 14/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

extension PlanOutOperation {
    /// Deterministically make a random choice with uniform probability based on given unit.
    final class UniformChoice: PlanOutOpRandom<Any> {
        override func randomExecute() throws -> Any? {
            guard let choices = args[Keys.choices.rawValue] as? [Any] else {
                throw OperationError.missingArgs(args: Keys.choices.rawValue, type: self)
            }

            let length = choices.count
            let randomizedIndex = (try hash() % length)

            return choices[randomizedIndex]
        }
    }
}
