//
//  Date+TimepieceTests.swift
//  Timepiece
//
//  Created by Naoto Kaneko on 2014/08/16.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

import Timepiece
import XCTest

class DateTestCase: XCTestCase {
    let now = Date()
    // TODO: Stub calendar's timezone
    let calendar = Calendar.current
    var birthday: Date! {
        var components = DateComponents()
        components.year = 1987
        components.month = 6
        components.day = 2
        components.hour = 0
        components.minute = 0
        components.second = 0
        return calendar.date(from: components)
    }
    let cst = TimeZone(abbreviation: "CST")!
    
    func testPlus() {
        let nextDay = calendar.date(byAdding: .day, value: 1, to: now)!
        XCTAssertEqual(now + 1.day, nextDay, "")
        
        let nextWeek = calendar.date(byAdding: .weekOfYear, value: 1, to: now)!
        XCTAssertEqual(now + 1.week, nextWeek, "")
    }
    
    func testMinusWithDuration() {
        let lastDay = calendar.date(byAdding: .day, value: -1, to: now)!
        XCTAssertEqual(now - 1.day, lastDay, "")
        
        let lastWeek = calendar.date(byAdding: .weekOfYear, value: -1, to: now)!
        XCTAssertEqual(now - 1.week, lastWeek, "")
    }
    
    func testMinusWithDate() {
        let date1 = Date.date(year: 2015, month: 5, day: 1)
        let date2 = date1 + 1.hour
        
        XCTAssertTrue(date2 - date1 == 1.hour, "")
    }
    
    func testMinusWithDifferentTimeZone() {
        let date1 = Date.date(year: 2015, month: 5, day: 1)
        var date2 = (date1 + 1.hour)
        let date3 = date2.change(timeZone: cst)
        XCTAssertTrue(date3! - date1 == 1.hour, "")
    }
    
    func testEqual() {
        let date1 = Date.date(year: 2015, month: 5, day: 1)
        let date2 = "2015-05-01".dateFromFormat("yyyy-MM-dd")
        let date3 = date1 - 1.second

        XCTAssertTrue(date1 == date2, "")
        XCTAssertTrue(date1 != date3, "")
    }
    
    func testEqualWithDifferentTimeZones() {
        var date1 = Date.date(year: 2015, month: 5, day: 1)
        let date2 = date1.change(timeZone: cst)
        
        XCTAssertTrue(date1 == date2, "")
    }

    func testCompare() {
        let date1 = Date.date(year: 2015, month: 5, day: 1)
        let date2 = date1 + 1.second
        let date3 = date1 - 1.second

        XCTAssertTrue(date1 < date2, "")
        XCTAssertTrue(date1 <= date1, "")
        XCTAssertTrue(date1 > date3, "")
        XCTAssertTrue(date1 >= date1, "")
    }
    
    func testCompareWithDifferentTimeZones() {
        let date1 = Date.date(year: 2015, month: 5, day: 1)
        var date2 = (date1 + 1.second)
        var date3 = (date1 - 1.second)
        let date4 = date2.change(timeZone: cst)
        let date5 = date3.change(timeZone: cst)
        
        XCTAssertTrue(date1 < date4!, "")
        XCTAssertTrue(date1 <= date1, "")
        XCTAssertTrue(date1 > date5!, "")
        XCTAssertTrue(date1 >= date1, "")
    }

    func testYear() {
        XCTAssertEqual(birthday.year, 1987, "")
    }
    
    func testMonth() {
        XCTAssertEqual(birthday.month, 6, "")
    }
    
    func testDay() {
        XCTAssertEqual(birthday.day, 2, "")
    }
    
    func testHour() {
        XCTAssertEqual(birthday.hour, 0, "")
    }
    
    func testMinute() {
        XCTAssertEqual(birthday.minute, 0, "")
    }
    
    func testSecond() {
        XCTAssertEqual(birthday.second, 0, "")
    }
    
    func testDateWithYearAndMonthAndDayAndHourAndMinuteAndSecond() {
        XCTAssertEqual(Date.date(year: 1987, month: 6, day: 2), birthday, "")
    }
    
    func testToday() {
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: now)
        components.hour = 0
        components.minute = 0
        components.second = 0
        let today = calendar.date(from: components)
        XCTAssertEqual(Date.today(), today!, "")
    }
    
    func testYesterday() {
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: now)
        components.day = now.day - 1
        components.hour = 0
        components.minute = 0
        components.second = 0
        let yesterday = calendar.date(from: components)
        XCTAssertEqual(Date.yesterday(), yesterday!, "")
    }
    
    func testTomorrow() {
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: now)
        components.day = now.day + 1
        components.hour = 0
        components.minute = 0
        components.second = 0
        let tomorrow = calendar.date(from: components)
        XCTAssertEqual(Date.tomorrow(), tomorrow!, "")
    }
    
    func testChange() {
//        XCTAssertEqual(now.change(year: 2000).year, 2000, "")
        XCTAssertEqual(now.change(month: 6).month, 6, "")
        XCTAssertEqual(now.change(day: 15).day, 15, "")
        XCTAssertEqual(now.change(hour: 9).hour, 9, "")
        XCTAssertEqual(now.change(minute: 30).minute, 30, "")
        XCTAssertEqual(now.change(second: 45).second, 45, "")
    }
    
    func testTimeIntervalDifference() {
        let oneMinuteFromNow = now + 1.minute
        let tenWeeksFromNow = now + 10.weeks
        
        XCTAssertEqual(oneMinuteFromNow - now, 60)
        XCTAssertEqualWithAccuracy(tenWeeksFromNow - now, 3600*24*7*10, accuracy: 3600)
    }
    
    func testChangeWeekday() {
        XCTAssertEqual(now.change(weekday: 1).weekday, 1, "")
    }
    
    func testChangeTimeZone() {
        var now = self.now
        let cstDate = now.change(timeZone: cst)
        XCTAssertEqual(cstDate?.timeZone, cst, "")
        XCTAssertNotNil(cstDate?.timeZone, "")
    }
    
    func testBeginningOf() {
        XCTAssertEqual(now.beginningOfYear.month, 1, "")
        XCTAssertEqual(now.beginningOfMonth.day, 1, "")
        XCTAssertEqual(now.beginningOfDay.hour, 0, "")
        XCTAssertEqual(now.beginningOfHour.minute, 0, "")
        XCTAssertEqual(now.beginningOfMinute.second, 0, "")
    }
	
	func testBeginningEndOfWeek() {
		let systemFirstWeekday = calendar.firstWeekday
		// Birthday was on tuesday (Tuesday, June 2, 1987)
		if systemFirstWeekday == 1 {
			// Weeks start on sunday:
			XCTAssertEqual(birthday.beginningOfWeek.month, 5, "")
			XCTAssertEqual(birthday.beginningOfWeek.day, 31, "")
			XCTAssertEqual(birthday.endOfWeek.month, 6, "")
			XCTAssertEqual(birthday.endOfWeek.day, 6, "")
		} else if systemFirstWeekday == 2 {
			// Weeks start on monday:
			XCTAssertEqual(birthday.beginningOfWeek.month, 6, "")
			XCTAssertEqual(birthday.beginningOfWeek.day, 1, "")
			XCTAssertEqual(birthday.endOfWeek.month, 6, "")
			XCTAssertEqual(birthday.endOfWeek.day, 7, "")
		}
	}
	
    func testEndOf() {
        XCTAssertEqual(now.endOfYear.month, 12, "")
        XCTAssertEqual(now.endOfDay.hour, 23, "")
        XCTAssertEqual(now.endOfHour.minute, 59, "")
        XCTAssertEqual(now.endOfMinute.second, 59, "")
    }
    
    func testEndOfMonth() {
        // Leap year
        let date = Date.date(year: 2012, month: 2, day: 1)
        XCTAssertEqual(date.endOfMonth.day, 29, "")
    }
    
    func testStringFromFormat() {
        let timestamp = birthday.stringFromFormat("yyyy-MM-dd HH:mm:SS")
        XCTAssertEqual(timestamp, "1987-06-02 00:00:00", "")
    }
}
