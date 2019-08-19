//
//  PlanOutOpUnaryExamples.swift
//  PlanOutKitTests
//
//  Created by David Christiandy on 19/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

import Quick
import Nimble
@testable import PlanOutKit

func unaryArgsBuilder(_ value: Any) -> [String: Any] {
    return [PlanOutOperation.Keys.value.rawValue: value]
}

final class PlanOutOpUnarySharedExamplesConfiguration: QuickConfiguration {
    override class func configure(_ configuration: Configuration) {
        sharedExamples(SharedBehavior.unaryOperator.rawValue) { context in
            let op = context() [SharedBehavior.Keys.op.rawValue] as! PlanOutExecutable
            let ctx = Interpreter()

            itBehavesLike(SharedBehavior.simpleOperator.rawValue) { [SharedBehavior.Keys.op.rawValue: op] }

            it("throws error if value argument does not exist") {
                let values = ["foo", "bar", "baz"]
                let args: [String: Any] = ["foo": values]

                expect { try op.executeOp(args: args, context: ctx) }.to(throwError(errorType: OperationError.self))
            }
        }
    }
}
