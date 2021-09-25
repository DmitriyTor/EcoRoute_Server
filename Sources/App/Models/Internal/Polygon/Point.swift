//
//  File.swift
//  
//
//  Created by d.toropkin on 25.09.2021.
//

import Foundation

/// Contains the coordinates of a point in a 2D Cartesian coordinate system.
public struct Point: Hashable {
    /// The x-coordinate of the point.
    public var x: Double
    /// The y-coordinate of the point.
    public var y: Double
}

extension Array where Element == Point {
    /// Returns only the unique points in the array.
    var unique: [Point] {
        return Array(Set<Point>(self))
    }
}

