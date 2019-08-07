//
//  IntExtensions.swift
//  SugarSwiftExtensions
//
//  Created by ZY on 19/08/07.
//  Copyright (c) 2019 ZY. All rights reserved.
//

import Foundation

extension Int{
    
    //MARK: - Convert to other types
    
    ///  Converts integer value to Double.
    public var toDouble: Double { return Double(self) }
    
    ///  Converts integer value to Float.
    public var toFloat: Float { return Float(self) }
    
    ///  Converts integer value to CGFloat.
    public var toCGFloat: CGFloat { return CGFloat(self) }
    
    ///  Converts integer value to String.
    public var toString: String { return String(self) }
    
    ///  Converts integer value to UInt.
    public var toUInt: UInt { return UInt(self) }
    
    ///  Converts integer value to Int32.
    public var toInt32: Int32 { return Int32(self) }
    
    ///  Converts integer value to Int64.
    public var toInt64: Int64 { return Int64(self) }
    
    ///  round integer:last digit round
    public var toRound: Int {
        guard let lastDigit = self.digitArray.last else { return self }
        if self.digits <= 1 { return self }
        var newDigits = self.digitArray
        if lastDigit >= 5{
            newDigits[self.digits - 2] += 1
        }else{
            newDigits[self.digits - 1] = 0
        }
        return newDigits.map{$0.toString}.joined().toInt() ?? self
    }
    
    ///  round integer:last digit floor
    public var toFloor: Int {
        if self.digits <= 1 { return self }
        var newDigits = self.digitArray
        newDigits[self.digits - 1] = 0
        return newDigits.map{$0.toString}.joined().toInt() ?? self
    }
    
    
    //MARK: - digits
    
    ///Returns number of digits in the integer.
    public var digits: Int {
        if self == 0 {
            return 1
        } else if Int(fabs(Double(self))) <= LONG_MAX {
            return Int(log10(fabs(Double(self)))) + 1
        } else {
            return -1; //out of bound
        }
    }
    
    /// The digits of an integer represented in an array(from most significant to least).
    /// This method ignores leading zeros and sign
    public var digitArray: [Int] {
        var digits = [Int]()
        for char in self.toString {
            if let digit = Int(String(char)) {
                digits.append(digit)
            }
        }
        return digits
    }


}
