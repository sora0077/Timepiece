//
//  DateComponents+Timepiece.swift
//  Timepiece
//
//  Created by Mattijs on 25/04/15.
//  Copyright (c) 2015 Naoto Kaneko. All rights reserved.
//

import Foundation

public extension DateComponents {
    init(_ duration: Duration) {
        self.init()
        switch duration.unit {
        case .day:
            day = duration.value
        case .weekday:
            weekday = duration.value
        case .weekOfMonth:
            weekOfMonth = duration.value
        case .weekOfYear:
            weekOfYear = duration.value
        case .hour:
            hour = duration.value
        case .minute:
            minute = duration.value
        case .month:
            month = duration.value
        case .second:
            second = duration.value
        case .year:
            year = duration.value
        default:
            () // unsupported / ignore
        }
    }
}
