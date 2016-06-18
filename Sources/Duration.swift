//
//  Duration.swift
//  Timepiece
//
//  Created by Naoto Kaneko on 2014/08/17.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

import Foundation

prefix func - (duration: Duration) -> (Duration) {
    return Duration(value: -duration.value, unit: duration.unit)
}

public struct Duration {
    public let value: Int
    public let unit: Calendar.Unit
    private let calendar = Calendar.current()
    
    /**
        Initialize a date before a duration.
    */
    public var ago: Date {
        return ago(from: Date())
    }
    
    public func ago(from date: Date) -> Date {
        return calendar.dateByAddingDuration(-self, toDate: date, options: .searchBackwards)!
    }
    
    /**
        Initialize a date after a duration.
    */
    public var later: Date {
        return later(from: Date())
    }
    
    public func later(from date: Date) -> Date {
        return calendar.dateByAddingDuration(self, toDate: date, options: .searchBackwards)!
    }
    
    /**
        This conversion is deprecated in 0.4.1 and will be obsoleted in 0.5.0.
    
        This operation is performed under incorrect assumption that 1 month is always equal to 30 days.
    */
    public var interval: TimeInterval {
        return unit.interval * TimeInterval(value)
    }
    
    public init(value: Int, unit: Calendar.Unit) {
        self.value = value
        self.unit = unit
    }
}
