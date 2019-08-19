//
//  PlanOutOpSimpleExamples.swift
//  PlanOutKitTests
//
//  Created by David Christiandy on 18/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

import Quick
import Nimble
@testable import PlanOutKit

final class PlanOutOpSimpleSharedExamplesConfiguration: QuickConfiguration {
    override class func configure(_ configuration: Configuration) {
        sharedExamples(SharedBehavior.simpleOperator.rawValue) { context in
            let op = context() [SharedBehavior.Keys.op.rawValue] as! PlanOutExecutable

            it("evaluates all argument values before executing the operation") {
                let args = ["a": 1, "b": 2, "c": 3]
                let context = MockContext()

                let _ = try? op.executeOp(args: args, context: context)

                expect(context.values.count).to(equal(args.values.count))
            }
        }
    }
}

private class MockContext: PlanOutOpContext {
    var values: [Any] = []
    var experimentSalt: String = ""

    func evaluate(_ value: Any) throws -> Any? {
        values.append(value)
        return value
    }

    func set(_ name: String, value: Any) {
        // no op
    }

    func get(_ name: String) throws -> Any? {
        return nil
    }

    func get<T>(_ name: String, defaultValue: T) throws -> T {
        return defaultValue
    }

    func getParams() throws -> [String : Any] {
        return [:]
    }

}
