//
//  MaxSpec.swift
//  PlanOutKitTests
//
//  Created by David Christiandy on 18/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

import Quick
import Nimble
@testable import PlanOutKit

final class MaxSpec: QuickSpec {
    override func spec() {
        describe("Max commutative operator") {
            let op = PlanOutOperation.Max()

            itBehavesLike(.commutativeOperator) { [.op: op] }

            it("returns the max value of values from the arguments") {
                let values = [1, -2.0, 3.0]
                var result: Double?

                expect { result = try op.execute(commutativeArgsBuilder(values), Interpreter()) }.toNot(throwError())

                expect(result!).to(equal(3.0))
            }
        }
    }
}

