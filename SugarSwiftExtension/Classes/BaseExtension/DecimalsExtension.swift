//
//  FloatPointExtension.swift
//  SugarSwiftExtensions
//
//  Created by ZY on 19/08/07.
//  Copyright (c) 2019 ZY. All rights reserved.
//

import Foundation

//MARK: -  Float Double  round to place

extension FloatingPoint{
    
    ///  Returns rounded FloatingPoint to specified number of places
    public func rounded(toPlaces places: Int) -> Self {
        guard places >= 0 else { return self }
        var divisor: Self = 1
        for _ in 0..<places { divisor *= 10 }
        return (self * divisor).rounded() / divisor
    }
    
    ///  Rounds current FloatingPoint to specified number of places
    public mutating func round(toPlaces places: Int) {
        self = rounded(toPlaces: places)
    }
    
    ///  Returns ceiled FloatingPoint to specified number of places
    public func ceiled(toPlaces places: Int) -> Self {
        guard places >= 0 else { return self }
        var divisor: Self = 1
        for _ in 0..<places { divisor *= 10 }
        return (self * divisor).rounded(.up) / divisor
    }
    
    ///  Ceils current FloatingPoint to specified number of places
    public mutating func ceil(toPlaces places: Int) {
        self = ceiled(toPlaces: places)
    }
    
}

extension Float{
    ///  Converts Float value to Double.
    public var toDouble: Double { return Double(self) }
}

extension Double{
    
    ///  Converts Double to Int
    public var toInt: Int { return Int(self) }
    
    ///  Converts Double value to percent string.
    public var toString: String { return String(self) }

    ///  Converts Double value to percent string.
    public var percent: String {
        return NumberFormatter.localizedString(from: NSNumber(value: self), number: .percent)
    }
    
    
}
