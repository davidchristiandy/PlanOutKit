//
//  NumericOperatorExamples.swift
//  PlanOutKitTests
//
//  Created by David Christiandy on 19/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

import Quick
import Nimble
@testable import PlanOutKit

private func dynamicArgsBuilder(_ value: Any, keys: [String]) -> [String: Any] {
    var args: [String: Any] = [:]
    keys.forEach { args[$0] = value }

    return args
}

final class NumericOperatorSharedExamplesConfiguration: QuickConfiguration {
    override class func configure(_ configuration: Configuration) {
        sharedExamples(SharedBehavior.numericOperator.rawValue) { context in
            let contextArgs = context()
            let op = contextArgs[SharedBehavior.Keys.op.rawValue] as! PlanOutExecutable
            let keys = contextArgs[SharedBehavior.Keys.argKeys.rawValue] as! [String]
            let ctx = Interpreter()

            it("should not throw error when given numeric types") {
                let value = 3.53
                let args = dynamicArgsBuilder(value, keys: keys)

                expect { try op.executeOp(args: args, context: ctx) }.toNot(throwError())
            }

            it("throws error when given string types") {
                let value = "some string"
                let args = dynamicArgsBuilder(value, keys: keys)

                expect { try op.executeOp(args: args, context: ctx) }.to(throwError(errorType: OperationError.self))
            }

            it("throws error when given list types") {
                let value = [1, 2, 3]
                let args = dynamicArgsBuilder(value, keys: keys)

                expect { try op.executeOp(args: args, context: ctx) }.to(throwError(errorType: OperationError.self))
            }

            it("throws error when given dictionary types") {
                let value = ["foo": 1, "bar": 2]
                let args = dynamicArgsBuilder(value, keys: keys)

                expect { try op.executeOp(args: args, context: ctx) }.to(throwError(errorType: OperationError.self))
            }

            it("throws error when given boolean types") {
                let value = false
                let args = dynamicArgsBuilder(value, keys: keys)

                expect { try op.executeOp(args: args, context: ctx) }.to(throwError(errorType: OperationError.self))
            }

            it("throws error when given non literal types") {
                let value = [1: 1, 2: 2, 3: 3]
                let args = dynamicArgsBuilder(value, keys: keys)

                expect { try op.executeOp(args: args, context: ctx) }.to(throwError(errorType: OperationError.self))
            }
        }
    }
}


