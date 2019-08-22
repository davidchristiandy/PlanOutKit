//
//  ReadableAssignment.swift
//  PlanoutKit
//
//  Created by David Christiandy on 14/08/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

/// Provide ways to access assignment values.
public protocol ReadableAssignment {
    /// Get value from assignment.
    ///
    /// - Parameter name: The variable name.
    /// - Returns: Assignment value.
    /// - Throws: OperationError
    func get(_ name: String) throws -> Any?

    /// Get value from assignment, with default value.
    ///
    /// The method will return defaultValue if there is no assignment value with matching variable name, or if the assignment value cannot be typecasted to type `T`.
    ///
    /// - Parameters:
    ///   - name: The variable name
    ///   - defaultValue: The fallback value
    /// - Returns: Assignment value or default value
    /// - Throws: OperationError
    func get<T>(_ name: String, defaultValue: T) throws -> T

    /// Get a dictionary of evaluated values from the experiment.
    ///
    /// - Returns: Dictionary of evaluated values
    /// - Throws: OperationError
    func getParams() throws -> [String: Any?]
}
