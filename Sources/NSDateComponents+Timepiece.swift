//
//  NSDateComponents+Timepiece.swift
//  Timepiece
//
//  Created by Mattijs on 25/04/15.
//  Copyright (c) 2015 Naoto Kaneko. All rights reserved.
//

import Foundation

public extension DateComponents {
    init(_ duration: Duration) {
        self.init()
        switch duration.unit{
        case Calendar.Unit.day:
            day = duration.value
        case Calendar.Unit.weekday:
            weekday = duration.value
        case Calendar.Unit.weekOfMonth:
            weekOfMonth = duration.value
        case Calendar.Unit.weekOfYear:
            weekOfYear = duration.value
        case Calendar.Unit.hour:
            hour = duration.value
        case Calendar.Unit.minute:
            minute = duration.value
        case Calendar.Unit.month:
            month = duration.value
        case Calendar.Unit.second:
            second = duration.value
        case Calendar.Unit.year:
            year = duration.value
        default:
            () // unsupported / ignore
        }
    }
}
