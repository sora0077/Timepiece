//
//  NSCalendarUnit+TimepieceTests.swift
//  Timepiece
//
//  Created by Mattijs on 13/05/15.
//  Copyright (c) 2015 Naoto Kaneko. All rights reserved.
//

import Timepiece
import XCTest

class NSCalendarUnitTestCase: XCTestCase {
    func testCalendarUnitIntervals() {
        // some sanity checks
        XCTAssertLessThan(Calendar.Unit.nanosecond.interval, 1, "")
        XCTAssertEqual(Calendar.Unit.second.interval, 1)
        XCTAssertEqual(Calendar.Unit.minute.interval, 60)
        XCTAssertEqual(Calendar.Unit.hour.interval, 3600)
        XCTAssertEqual(Calendar.Unit.day.interval, 24 * 3600)
        XCTAssertEqual(Calendar.Unit.weekOfYear.interval, 7 * 24 * 3600)
        XCTAssertEqual(Calendar.Unit.month.interval, 30*86400, "")
        XCTAssertEqual(Calendar.Unit.quarter.interval, 146097/400/4*86400, "")
        XCTAssertEqual(Calendar.Unit.year.interval, 146097/400*86400, "")
        
        // some unsupported calendar units should return 0 as interval
        XCTAssert(Calendar.Unit.era.interval == 0)
        XCTAssert(Calendar.Unit.calendar.interval == 0)
        XCTAssert(Calendar.Unit.timeZone.interval == 0)
    }
}
