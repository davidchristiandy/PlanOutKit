//
//  NumericOperatorSharedExamples.swift
//  PlanOutKitTests
//
//  Created by David Christiandy on 19/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

import Quick
import Nimble
@testable import PlanOutKit

final class NumericOperatorSharedExamplesConfiguration: QuickConfiguration {
    override class func configure(_ configuration: Configuration) {
        sharedExamples(SharedBehavior.commutativeOperator.rawValue) { context in
            let op = context() [SharedBehavior.Keys.op.rawValue] as! PlanOutExecutable
            let ctx = Interpreter()

            itBehavesLike(SharedBehavior.simpleOperator.rawValue) { [SharedBehavior.Keys.op.rawValue: op] }

            it("should not throw errors for arguments with numeric types") {
                let values = [1, 2, 3]
                let args: [String: Any] = [PlanOutOperation.Keys.values.rawValue: values]

                expect { try op.executeOp(args: args, context: ctx) }.toNot(throwError())
            }

            it("should not throw errors for arguments with mixed numeric types") {
                let values = [1, 2.0, 3.0]
                let args: [String: Any] = [PlanOutOperation.Keys.values.rawValue: values]

                expect { try op.executeOp(args: args, context: ctx) }.toNot(throwError())
            }

            it("throws error if argument contains non-numeric types") {
                let values = ["foo", "bar", "baz"]
                let args: [String: Any] = [PlanOutOperation.Keys.values.rawValue: values]

                expect { try op.executeOp(args: args, context: ctx) }.to(throwError(errorType: OperationError.self))
            }

            it("throws error if values does not exist") {
                let values = ["foo", "bar", "baz"]
                let args: [String: Any] = ["foo": values]

                expect { try op.executeOp(args: args, context: ctx) }.to(throwError(errorType: OperationError.self))
            }
        }
    }
}


