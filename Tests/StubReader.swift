//
//  StubReader.swift
//  PlanOutKitTests
//
//  Created by David Christiandy on 04/09/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

import Foundation

final class StubReader {
    static func get(_ name: String) -> String {
        let path = Bundle(for: self).path(forResource: name, ofType: "json")!
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path))

        return String(data: jsonData, encoding: .utf8)!
    }

    static func getDictionary(_ name: String) -> [String: Any] {
        let value = get(name)
        return try! JSONSerialization.jsonObject(with: value.data(using: .utf8)!) as! [String: Any]
    }
}
