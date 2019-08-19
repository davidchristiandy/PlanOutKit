//
//  LiteralOperationSpec.swift
//  PlanOutKitTests
//
//  Created by David Christiandy on 19/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

import Quick
import Nimble
@testable import PlanOutKit

final class LiteralOperationSpec: QuickSpec {
    override func spec() {
        describe("Literal operator") {
            let op = PlanOutOperation.LiteralOperation()

            context("when variable key does not exist") {
                it("returns nil") {
                    let args = ["foo": "bar"]
                    let ctx = SimpleMockContext()
                    var result: Any?

                    expect { result = try op.execute(args, ctx) }.toNot(throwError())
                    expect(result).to(beNil())
                }
            }
            context("when value key does exists") {
                it("does not evaluate the value") {
                    let args = [PlanOutOperation.Keys.value.rawValue: "bar"]
                    let ctx = SimpleMockContext()

                    expect { try op.execute(args, ctx) }.toNot(throwError())
                    expect(ctx.evaluated.count) == 0
                }

                it("returns the value from the arguments") {
                    let value = "bar"
                    let args = [PlanOutOperation.Keys.value.rawValue: value]
                    let ctx = SimpleMockContext()
                    var result: Any?

                    expect { result = try op.execute(args, ctx) }.toNot(throwError())
                    expect((result! as! String)) == value
                }
            }
        }
    }
}
