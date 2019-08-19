//
//  ReturnSpec.swift
//  PlanOutKitTests
//
//  Created by David Christiandy on 19/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

import Quick
import Nimble
@testable import PlanOutKit

final class ReturnSpec: QuickSpec {
    override func spec() {
        describe("Return operator") {
            let op = PlanOutOperation.Return()

            it("throws immediately upon execution") {
                let args = ["foo": "bar"]
                let ctx = SimpleMockContext()

                expect { try op.execute(args, ctx) }.to(throwError(errorType: OperationError.self))
            }

            context("when value argument is not provided") {
                it("returns false by default") {
                    let args: [String: Any] = [:]
                    let ctx = SimpleMockContext()

                    expect { try op.execute(args, ctx) }.to(throwError(OperationError.stop(false)))
                }
            }

            context("when value argument is provided") {
                it("evaluates the argument value before it is processed") {
                    let args = ["value": 1.2, "b": 2.5, "c": 3.3]
                    let ctx = SimpleMockContext()

                    expect { try op.execute(args, ctx) }.to(throwError(OperationError.stop(true)))
                    expect(ctx.evaluated.count) == 1
                }

                it("returns value depending on the argument value") {
                    let args = ["value": true]
                    let ctx = SimpleMockContext()

                    expect { try op.execute(args, ctx) }.to(throwError(OperationError.stop(true)))
                }
            }
        }
    }
}
