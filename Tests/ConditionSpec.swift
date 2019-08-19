//
//  ConditionSpec.swift
//  PlanOutKitTests
//
//  Created by David Christiandy on 19/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

import Quick
import Nimble
@testable import PlanOutKit

final class ConditionSpec: QuickSpec {
    override func spec() {
        describe("Condition operator") {
            let op = PlanOutOperation.Condition()

            it("throws when if argument is not found") {
                let thenArg = ""
                let args = [PlanOutOperation.Keys.thenCondition.rawValue: thenArg]
                let ctx = SimpleMockContext()

                expect { try op.execute(args, ctx) }.to(throwError(errorType: OperationError.self))
            }

            it("throws when then argument is not found") {
                let ifArg = ""
                let args = [PlanOutOperation.Keys.ifCondition.rawValue: ifArg]
                let ctx = SimpleMockContext()

                expect { try op.execute(args, ctx) }.to(throwError(errorType: OperationError.self))
            }

            it("evaluates the if argument value") {
                let ifArg = ""
                let thenArg = ""
                let args = [PlanOutOperation.Keys.ifCondition.rawValue: ifArg, PlanOutOperation.Keys.thenCondition.rawValue: thenArg]
                let ctx = SimpleMockContext()

                expect { try op.execute(args, ctx) }.toNot(throwError())
                expect((ctx.evaluated.first! as! String)) == ifArg
            }

            context("if argument evaluates to true") {
                it("evaluates the then argument") {
                    let ifArg = "if value"
                    let thenArg = "then value"
                    let args = [PlanOutOperation.Keys.ifCondition.rawValue: ifArg, PlanOutOperation.Keys.thenCondition.rawValue: thenArg]
                    let ctx = SimpleMockContext()

                    expect { try op.execute(args, ctx) }.toNot(throwError())
                    expect((ctx.evaluated as! [String])) == [ifArg, thenArg]
                }

                it("returns the evaluated value from the then argument") {
                    let ifArg = "if value"
                    let thenArg = "then value"
                    let args = [PlanOutOperation.Keys.ifCondition.rawValue: ifArg, PlanOutOperation.Keys.thenCondition.rawValue: thenArg]
                    let ctx = SimpleMockContext()
                    var result: Any?

                    expect { result = try op.execute(args, ctx) }.toNot(throwError())
                    expect((result as! String)) == thenArg
                }
            }

            context("if argument evaluates to false") {
                it("should not evaluate the then argument") {
                    let ifArg = 0
                    let thenArg = "then value"
                    let args: [String: Any] = [PlanOutOperation.Keys.ifCondition.rawValue: ifArg,
                                               PlanOutOperation.Keys.thenCondition.rawValue: thenArg]
                    let ctx = SimpleMockContext()

                    expect { try op.execute(args, ctx) }.toNot(throwError())
                    expect(ctx.evaluated.count) == 1
                    expect((ctx.evaluated.first! as! Int)) == ifArg
                }

                it("returns nil") {
                    let ifArg = false
                    let thenArg = "then value"
                    let args: [String: Any] = [PlanOutOperation.Keys.ifCondition.rawValue: ifArg,
                                               PlanOutOperation.Keys.thenCondition.rawValue: thenArg]
                    let ctx = SimpleMockContext()
                    var result: Any?

                    expect { result = try op.execute(args, ctx) }.toNot(throwError())
                    expect(result).to(beNil())
                }
            }
        }
    }
}
