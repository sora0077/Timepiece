//
//  Int+TimepieceTests.swift
//  Timepiece
//
//  Created by Naoto Kaneko on 2014/08/15.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

import Timepiece
import XCTest

class IntTestCase: XCTestCase {
    func testYear() {
        XCTAssertEqual(1.year.value, 1, "")
        XCTAssertEqual(1.year.unit, Calendar.Unit.year, "")
        XCTAssertEqual(1.year.interval, 146097/400 * 86400 * 1, "")
    }
    
    func testYears() {
        XCTAssertEqual(2.years.value, 2, "")
        XCTAssertEqual(2.years.unit, Calendar.Unit.year, "")
        XCTAssertEqual(2.years.interval,146097/400 * 86400 * 2, "")
    }
    
    func testMonth() {
        XCTAssertEqual(1.month.value, 1, "")
        XCTAssertEqual(1.month.unit, Calendar.Unit.month, "")
        XCTAssertEqual(1.month.interval, 30 * 86400 * 1, "")
    }
    
    func testMonths() {
        XCTAssertEqual(2.months.value, 2, "")
        XCTAssertEqual(2.months.unit, Calendar.Unit.month, "")
        XCTAssertEqual(2.months.interval, 30 * 86400 * 2, "")
    }
    
    func testWeek() {
        XCTAssertEqual(1.week.value, 1, "")
        XCTAssertEqual(1.week.unit, Calendar.Unit.weekOfYear, "")
        XCTAssertEqual(1.week.interval, 7 * 86400 * 1, "")
    }
    func testWeeks() {
        XCTAssertEqual(2.weeks.value, 2, "")
        XCTAssertEqual(2.weeks.unit, Calendar.Unit.weekOfYear, "")
        XCTAssertEqual(2.weeks.interval, 7 * 86400 * 2, "")
    }
    
    func testDay() {
        XCTAssertEqual(1.day.value, 1, "")
        XCTAssertEqual(1.day.unit, Calendar.Unit.day, "")
        XCTAssertEqual(1.day.interval, 86400 * 1, "")
    }
    
    func testDays() {
        XCTAssertEqual(2.days.value, 2, "")
        XCTAssertEqual(2.days.unit, Calendar.Unit.day, "")
        XCTAssertEqual(2.days.interval, 86400 * 2, "")
    }
    
    func testHour() {
        XCTAssertEqual(1.hour.value, 1, "")
        XCTAssertEqual(1.hour.unit, Calendar.Unit.hour, "")
        XCTAssertEqual(1.hour.interval, 3600 * 1, "")
    }
    
    func testHours() {
        XCTAssertEqual(2.hours.value, 2, "")
        XCTAssertEqual(2.hours.unit, Calendar.Unit.hour, "")
        XCTAssertEqual(2.hours.interval, 3600 * 2, "")
    }
    
    func testMinute() {
        XCTAssertEqual(1.minute.value, 1, "")
        XCTAssertEqual(1.minute.unit, Calendar.Unit.minute, "")
        XCTAssertEqual(1.minute.interval, 60, "")
    }
    
    func testMinutes() {
        XCTAssertEqual(2.minutes.value, 2, "")
        XCTAssertEqual(2.minutes.unit, Calendar.Unit.minute, "")
        XCTAssertEqual(2.minutes.interval, 60 * 2, "")
    }
    
    func testSecond() {
        XCTAssertEqual(1.second.value, 1, "")
        XCTAssertEqual(1.second.unit, Calendar.Unit.second, "")
        XCTAssertEqual(1.second.interval, 1, "")
    }
    
    func testSeconds() {
        XCTAssertEqual(2.seconds.value, 2, "")
        XCTAssertEqual(2.seconds.unit, Calendar.Unit.second, "")
        XCTAssertEqual(2.seconds.interval, 2, "")
    }
}
