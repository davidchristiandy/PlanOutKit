//
//  DefaultSegmentAllocatorSpec.swift
//  PlanOutKitTests
//
//  Created by David Christiandy on 16/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

import Quick
import Nimble
@testable import PlanOutKit

// always return the first `draws` element
private func mockSampler(_ choices: [Any], _ draws: Int, _ unit: String) -> [Any]? {
    return Array(choices.prefix(draws))
}

// always return the min value
private func mockRandomizer(_ minValue: Int, _ maxValue: Int, _ unit: String) -> Int? {
    return minValue
}

final class DefaultSegmentAllocatorSpec: QuickSpec {
    override func spec() {
        describe("DefaultSegmentAllocator") {
            describe("Initialization") {
                it("should store information of total segments") {
                    let allocator = DefaultSegmentAllocator(totalSegments: 10)
                    expect(allocator.totalSegments).to(equal(10))
                }
            }

            describe("Segment allocation") {
                context("for invalid allocation requests") {
                    it("throws if requested segment count is larger than available segments") {}
                    it("throws if requested segment count is less than one") {}
                    it("throws if the identifier already exists") {}
                    it("throws if the preallocated segments does not exist in the available pool") {}
                    it("throws if segments sampling calculation produces invalid or nil results") {}
                }

                context("for valid allocation requests") {
                    it("returns the segments allocated for the identifier") {}
                }
            }

            describe("Segment deallocation") {}
            describe("Identifier mapping") {}
        }
    }
}
