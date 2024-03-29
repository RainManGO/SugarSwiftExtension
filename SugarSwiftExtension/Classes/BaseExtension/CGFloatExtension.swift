//
//  CGFloatExtension.swift
//  SugarSwiftExtensions
//
//  Created by ZY on 19/08/07.
//  Copyright (c) 2019 ZY. All rights reserved.
//
import UIKit

extension CGFloat {
    
    /// EZSE: Return the central value of CGFloat.
    public var center: CGFloat { return (self / 2) }
    
    /// EZSwiftExtensions
    public func degreesToRadians() -> CGFloat {
        return (.pi * self) / 180.0
    }
    
    /// EZSwiftExtensions
    public mutating func toRadiansInPlace() {
        self = (.pi * self) / 180.0
    }
    
    /// EZSE: Converts angle degrees to radians.
    public static func degreesToRadians(_ angle: CGFloat) -> CGFloat {
        return (.pi * angle) / 180.0
    }
    
    /// EZSE: Converts radians to degrees.
    public func radiansToDegrees() -> CGFloat {
        return (180.0 * self) / .pi
    }
    
    /// EZSE: Converts angle radians to degrees mutable version.
    public mutating func toDegreesInPlace() {
        self = (180.0 * self) / .pi
    }
    
    /// EZSE : Converts angle radians to degrees static version.
    public static func radiansToDegrees(_ angleInDegrees: CGFloat) -> CGFloat {
        return (180.0 * angleInDegrees) / .pi
    }
    
    /// EZSE: Returns a random floating point number between 0.0 and 1.0, inclusive.
    public static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    /// EZSE: Returns a random floating point number in the range min...max, inclusive.
    public static func random(within: Range<CGFloat>) -> CGFloat {
        return CGFloat.random() * (within.upperBound - within.lowerBound) + within.lowerBound
    }
    
    /// EZSE: Returns a random floating point number in the range min...max, inclusive.
    public static func random(within: ClosedRange<CGFloat>) -> CGFloat {
        return CGFloat.random() * (within.upperBound - within.lowerBound) + within.lowerBound
    }
    
    /**
     EZSE :Returns the shortest angle between two angles. The result is always between
     -π and π.
     
     Inspired from : https://github.com/raywenderlich/SKTUtils/blob/master/SKTUtils/CGFloat%2BExtensions.swift
     */
    public static func shortestAngleInRadians(from first: CGFloat, to second: CGFloat) -> CGFloat {
        let twoPi = CGFloat(.pi * 2.0)
        var angle = (second - first).truncatingRemainder(dividingBy: twoPi)
        if angle >= .pi {
            angle -= twoPi
        }
        if angle <= -.pi {
            angle += twoPi
        }
        return angle
    }
}
