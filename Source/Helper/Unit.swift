//
//  Unit.swift
//  PlanoutKit
//
//  Created by David Christiandy on 30/07/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

/// Simple wrapper for user input.
struct Unit {
    /// Joined string representation of unit values.
    ///
    /// This value will be used as primary hash value for PlanOut random operations.
    let identifier: String

    /// List of unit keys.
    let keys: [String]

    /// Map of user inputs.
    let inputs: [String: Any]

    /// Map of overrides.
    let overrides: [String: Any]

    /// Unit values obtained from inputs variable, given unitKeys.
    ///
    /// If the unit key doesn't exist in the input, or if the input is empty, then this will return an empty array.
    /// - Returns: Array of unit strings
    let unitValues: [String]

    init(keys: [String] = [], inputs: [String: Any] = [:], overrides: [String: Any] = [:]) {
        // map unit values from input variables based on unit keys
        unitValues = keys.compactMap {
            guard let anyValue = inputs[$0],
                case let Literal.string(unitValue) = Literal(anyValue) else {
                return nil
            }
            return unitValue
        }
        identifier = SaltProvider.generate(values: unitValues)

        self.keys = keys
        self.inputs = inputs
        self.overrides = overrides
    }
}
