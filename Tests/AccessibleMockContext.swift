//
//  AccessibleMockContext.swift
//  PlanOutKitTests
//
//  Created by David Christiandy on 19/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

@testable import PlanOutKit

final class AccessibleMockContext: PlanOutOpContext {
    var params: [String: Any] = [:]
    var experimentSalt: String = "AccessibleMockContext"

    func evaluate(_ value: Any) throws -> Any? {
        return value
    }

    func set(_ name: String, value: Any) {
        params[name] = value
    }

    func get(_ name: String) throws -> Any? {
        return params[name]
    }

    func get<T>(_ name: String, defaultValue: T) throws -> T {
        return (try self.get(name) as? T) ?? defaultValue
    }

    func getParams() throws -> [String : Any] {
        return params
    }
}
