//
//  EqualsSpec.swift
//  PlanOutKitTests
//
//  Created by David Christiandy on 19/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

import Quick
import Nimble
@testable import PlanOutKit

final class EqualsSpec: QuickSpec {
    override func spec() {
        describe("Equals binary operator") {
            let op = PlanOutOperation.Equals()

            itBehavesLike(.binaryOperator) { [.op: op] }

            /*
             Further tests regarding value equality is covered in the LiteralSpec (Equatable tests)
             */

            it("returns the remainder value from the argument") {
                let left = 4
                let right = 3
                let args = binaryArgsBuilder(left, right)
                var result: Bool?

                expect { result = try op.execute(args, Interpreter()) }.toNot(throwError())
                expect(result!).to(equal(false))
            }
        }
    }
}
