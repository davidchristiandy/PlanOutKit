//
//  DivideSpec.swift
//  PlanOutKitTests
//
//  Created by David Christiandy on 19/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

import Quick
import Nimble
@testable import PlanOutKit

final class DivideSpec: QuickSpec {
    override func spec() {
        describe("Divide binary operator") {
            let op = PlanOutOperation.Divide()

            itBehavesLike(.binaryOperator) { [.op: op] }

            itBehavesLike(.numericOperator) { [.op: op,
                                               .argKeys: [PlanOutOperation.Keys.left.rawValue,
                                                          PlanOutOperation.Keys.right.rawValue]] }

            it("returns the division result") {
                let left = 4
                let right = 2
                let args = binaryArgsBuilder(left, right)
                var result: Double?

                expect { result = try op.execute(args, Interpreter()) }.toNot(throwError())
                expect(result!).to(equal(2.0))
            }
        }
    }
}
