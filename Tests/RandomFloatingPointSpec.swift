//
//  RandomFloatingPointSpec.swift
//  PlanOutKitTests
//
//  Created by David Christiandy on 19/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

import Quick
import Nimble
@testable import PlanOutKit

final class RandomFloatingPointSpec: QuickSpec {
    override func spec() {
        describe("RandomFloatingPoint random operator") {
            let op = PlanOutOperation.RandomFloatingPoint()

            itBehavesLike(.randomOperator) { [.op: op] }

            describe("Argument validation") {
                it("throws if min value does not exist in the arguments") {
                    let ctx = SimpleMockContext()
                    let maxValue = 1.0
                    let args: [String: Any] = [
                        PlanOutOperation.Keys.unit.rawValue: "x",
                        PlanOutOperation.Keys.max.rawValue: maxValue
                    ]

                    expect { try op.execute(args, ctx) }.to(throwError(errorType: OperationError.self))
                }

                it("throws if min value does not exist in the arguments") {
                    let ctx = SimpleMockContext()
                    let minValue = 1.0
                    let args: [String: Any] = [
                        PlanOutOperation.Keys.unit.rawValue: "x",
                        PlanOutOperation.Keys.min.rawValue: minValue
                    ]

                    expect { try op.execute(args, ctx) }.to(throwError(errorType: OperationError.self))
                }

                it("throws if min value is larger than max value") {
                    let ctx = SimpleMockContext()
                    let minValue = 4.0
                    let maxValue = 1.0
                    let args: [String: Any] = [
                        PlanOutOperation.Keys.unit.rawValue: "x",
                        PlanOutOperation.Keys.min.rawValue: minValue,
                        PlanOutOperation.Keys.max.rawValue: maxValue
                    ]

                    expect { try op.execute(args, ctx) }.to(throwError(errorType: OperationError.self))
                }
            }

            describe("Distribution correctness") {
                // TODO: how to verify random floating point distribution without sacrificing accuracy due to rounding?
            }
        }
    }
}
