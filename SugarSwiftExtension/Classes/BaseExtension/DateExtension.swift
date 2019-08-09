//
//  DateExtension.swift
//  SugarSwiftExtensions
//
//  Created by ZY on 19/08/07.
//  Copyright (c) 2019 ZY. All rights reserved.
//

import Foundation

enum ConstomDateFormatter : String{
    case rfc1123                 = "EEE',' dd' 'MMM' 'yyyy HH' :'mm' :'ss zzz"
    case rfc850                  = "EEEE',' dd'-'MMM'-'yy HH':'mm':'ss z"
    case asctime                 = "EEE MMM d HH':'mm':'ss yyyy"
    case iso8601DateOnly         = "yyyy-MM-dd"
    case iso8601DateHrMinOnly    = "yyyy-MM-dd'T'HH:mmxxxxx"
    case iso8601DateHrMinSecOnly = "yyyy-MM-dd'T'HH:mm:ssxxxxx"
    case iso8601DateHrMinSecMs   = "yyyy-MM-dd'T'HH:mm:ss.SSSxxxxx"
    case cnDateOnly              = "yyyy年MM月dd日"
    case cnDateHrMinSec          = "yyyy年MM月dd日 HH时mm分ss秒"
}

extension Date{
    
    /// Initializes Date from string and format
    public init?(fromString string: String,
                 format: String,
                 timezone: TimeZone = TimeZone.autoupdatingCurrent,
                 locale: Locale = Locale.current) {
            let formatter = DateFormatter()
            formatter.timeZone = timezone
            formatter.locale = locale
            formatter.dateFormat = format
            if let date = formatter.date(from: string) {
                self = date
            } else {
                return nil
            }
    }
    
    /// Initializes Date from string
    public init?(httpDateString: String) {
        if let cnDateOnly = Date(fromString: httpDateString, format: ConstomDateFormatter.cnDateOnly.rawValue) {
            self = cnDateOnly
            return
        }
        if let cnDateHrMinSec = Date(fromString: httpDateString, format: ConstomDateFormatter.cnDateHrMinSec.rawValue) {
            self = cnDateHrMinSec
            return
        }
        if let rfc1123 = Date(fromString: httpDateString, format: ConstomDateFormatter.rfc1123.rawValue) {
            self = rfc1123
            return
        }
        if let rfc850 = Date(fromString: httpDateString, format:  ConstomDateFormatter.rfc850.rawValue) {
            self = rfc850
            return
        }
        if let asctime = Date(fromString: httpDateString, format: ConstomDateFormatter.asctime.rawValue) {
            self = asctime
            return
        }
        if let iso8601DateOnly = Date(fromString: httpDateString, format: ConstomDateFormatter.iso8601DateOnly.rawValue) {
            self = iso8601DateOnly
            return
        }
        if let iso8601DateHrMinOnly = Date(fromString: httpDateString, format: ConstomDateFormatter.iso8601DateHrMinOnly.rawValue) {
            self = iso8601DateHrMinOnly
            return
        }
        if let iso8601DateHrMinSecOnly = Date(fromString: httpDateString, format: ConstomDateFormatter.iso8601DateHrMinSecOnly.rawValue) {
            self = iso8601DateHrMinSecOnly
            return
        }
        if let iso8601DateHrMinSecMs = Date(fromString: httpDateString, format: ConstomDateFormatter.iso8601DateHrMinSecMs.rawValue) {
            self = iso8601DateHrMinSecMs
            return
        }
        return nil
    }
    
    /// Converts Date to String
    public func toString(dateStyle: DateFormatter.Style = .medium, timeStyle: DateFormatter.Style = .medium) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return formatter.string(from: self)
    }
    
    /// Converts Date to String, with format
    public func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    /// Calculates how many days passed from now to date
    public func daysInBetweenDate(_ date: Date) -> Double {
        var diff = self.timeIntervalSince1970 - date.timeIntervalSince1970
        diff = fabs(diff/86400)
        return diff
    }
    
    /// Calculates how many hours passed from now to date
    public func hoursInBetweenDate(_ date: Date) -> Double {
        var diff = self.timeIntervalSince1970 - date.timeIntervalSince1970
        diff = fabs(diff/3600)
        return diff
    }
    
    /// Calculates how many minutes passed from now to date
    public func minutesInBetweenDate(_ date: Date) -> Double {
        var diff = self.timeIntervalSince1970 - date.timeIntervalSince1970
        diff = fabs(diff/60)
        return diff
    }
    
    /// Calculates how many seconds passed from now to date
    public func secondsInBetweenDate(_ date: Date) -> Double {
        var diff = self.timeIntervalSince1970 - date.timeIntervalSince1970
        diff = fabs(diff)
        return diff
    }
    
    /// Check if date is in future.
    public var isFuture: Bool {
        return self > Date()
    }
    
    /// Check if date is in past.
    public var isPast: Bool {
        return self < Date()
    }
    
    ///  Get the year from the date
    public var year: Int {
        return Calendar.current.component(Calendar.Component.year, from: self)
    }
    
    ///  Get the month from the date
    public var month: Int {
        return Calendar.current.component(Calendar.Component.month, from: self)
    }
    
    //  Get the day from the date
    public var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    
    /// Get the hours from date
    public var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }
    
    /// Get the minute from date
    public var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }
    
    /// Get the second from the date
    public var second: Int {
        return Calendar.current.component(.second, from: self)
    }
    
    ///  Gets the nano second from the date
    public var nanosecond: Int {
        return Calendar.current.component(.nanosecond, from: self)
    }
    
    ///  Gets diff month Date
    public func getDiffMonthDate(diff:Int) -> Date? {
        return Calendar.current.date(byAdding: Calendar.Component.month, value: diff, to: self)
    }
    
    ///  Gets diff month number
    public func getDiffMonth(diff:Int) -> Int? {
        if let diffDate = getDiffMonthDate(diff: diff){
            return Calendar.current.dateComponents([.month], from: diffDate).month
        }
        return nil
    }
    
    ///Gets nature day in month
    public func getNatureDayInMonth() -> Int? {
        return Calendar.current.range(of: .day, in: .month, for: self)?.count
    }
    
}
