//
//  NSCalendar+Timepiece.swift
//  Timepiece
//
//  Created by Mattijs on 25/04/15.
//  Copyright (c) 2015 Naoto Kaneko. All rights reserved.
//

import Foundation

private let supportsDateByAddingUnit = Calendar.current().responds(to: #selector(Calendar.date(byAdding:value:to:options:)))

extension Calendar {
    func dateByAddingDuration(_ duration: Duration, toDate date: Date, options opts: Calendar.Options) -> Date? {
        if supportsDateByAddingUnit {
            return self.date(byAdding: duration.unit, value: duration.value, to: date, options: .searchBackwards)!
        }
        else {
            // otherwise fallback to NSDateComponents
            return self.date(byAdding: DateComponents(duration), to: date, options: .searchBackwards)!
        }
    }
}
