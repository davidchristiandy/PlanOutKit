//
//  SimpleMockContext.swift
//  PlanOutKitTests
//
//  Created by David Christiandy on 19/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

@testable import PlanOutKit

final class SimpleMockContext: PlanOutOpContext {
    var evaluated: [Any] = []
    var experimentSalt: String = ""

    func evaluate(_ value: Any) throws -> Any? {
        evaluated.append(value)
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
