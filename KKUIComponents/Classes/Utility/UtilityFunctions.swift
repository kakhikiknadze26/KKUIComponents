//
//  UtilityFunctions.swift
//  KKUIComponents
//
//  Created by Kakhi Kiknadze on 9/20/20.
//

import UIKit

/// Takes the value, passes it to closure and returns the mutated version.
/// # Code
/// ```
/// let view = configure(UIView()) {
///     $0.backgroundColor = .orange
/// }
/// ```
/// or lazily
/// ```
/// lazy var view = configure(UIView()) {
///     $0.backgroundColor = .orange
/// }
/// ```
/// - Parameters:
///     - value: Initialized object.
///     - closure: closure where modifications on value happens.
/// - Returns: mutated version of input value
///
func configure<T>(_ value: T, using closure: (inout T) throws -> Void) rethrows -> T {
    var value = value
    try closure(&value)
    return value
}
