//
//  WeightedChoice.swift
//  PlanoutKit
//
//  Created by David Christiandy on 14/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

extension PlanOutOperation {
    /// Deterministically make a random choice with weighted probability based on given unit.
    final class WeightedChoice: PlanOutOpRandom<Any> {
        override func randomExecute() throws -> Any? {
            // Following the implementation in Python and planout4j, nil or empty choices would only return nil instead of throwing an error.
            guard let choices = args[Keys.choices.rawValue] as? [Any],
                let weights = args[Keys.weights.rawValue] as? [Any],
                !choices.isEmpty else {
                    return nil
            }

            // map weight values to an array of Double.
            let weightValues: [Double] = weights.compactMap {
                if case let Literal.number(value) = Literal($0) {
                    return value
                }
                return nil
            }

            // ensure that after compactMap, weightValue still has the same count as choices.
            // The number of elements between choices and weightValues *must* match, because they're index-based.
            guard choices.count == weightValues.count else {
                throw OperationError.invalidArgs(expected: "choices.count == weights.count", got: "choices: \(choices.count), weights: \(weights.count)")
            }

            // Calculate the weighted choice.
            // The strategy is first to create an array with the weight values added into the next index (i.e. like Fibonacci sequence), and then use the first and last value as boundary to generate a random number. Example:
            //
            //  Choices:    [A, B, C]
            //  weights:    [0.1, 0.3, 0.5]
            //  sumWeights: [0.1, (0.1+0.3), (0.1+0.3+0.5)]
            //
            // Second, generate a random number with min=0.1, max=0.9. Example: given random number 0.32, loop through sumWeights and stop at the index where random number > value. In this case, random number 0.32 will stop at index 1 because 0.32 ≤ 0.4.
            // Finally, the index will then be used to make a choice (i.e. B).

            let sumWeights: [Double] = weightValues.reduce(into: []) { $0.append(($0.last ?? 0.0) + $1) }

            // ensure that there is a distance between min weight and max weight.
            guard let minWeight = sumWeights.first, let maxWeight = sumWeights.last, minWeight < maxWeight else {
                throw OperationError.unexpected("Invalid weight values: \(sumWeights)")
            }

            // generate the deterministically-random number.
            let randomValue: Double = try getUniform(minValue: minWeight, maxValue: maxWeight)

            // loop through the sumWeights to find the index.
            for (index, value) in sumWeights.enumerated() {
                if randomValue > value {
                    return choices[index]
                }
            }

            // theoretically, this should not happen.
            throw OperationError.unexpected("Random value (\(randomValue)) out of sumWeights' range (\(minWeight)-\(maxWeight))")
        }
    }
}
