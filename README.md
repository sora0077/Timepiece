# Timepiece [![Version](http://img.shields.io/cocoapods/v/Timepiece.svg?style=flat)](http://cocoadocs.org/docsets/Timepiece) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![Build Status](https://travis-ci.org/naoty/Timepiece.svg?branch=travis-ci)](https://travis-ci.org/naoty/Timepiece)
Intuitive Date extensions in Swift

## Usage

### Add durations to date

```swift
let now = Date()
let nextWeek = now + 1.week
let dayAfterTomorrow = now + 2.days

// shortcuts #1
let today = Date.today()
let tomorrow = Date.tomorrow()
let yesterday = Date.yesterday()

// shortcuts #2
let dayBeforeYesterday = 2.days.ago
let tokyoOlympicYear = 5.years.later
```

### Initialize by specifying date components

```swift
let birthday = Date.date(year: 1987, month: 6, day: 2)
let firstCommitDate = Date.date(year: 2014, month: 8, day: 15, hour: 20, minute: 25, second: 43)
```

### Initialize by changing date components

```swift
let now = Date()
let christmas = now.change(month: 12, day: 25)
let thisSunday = now.change(weekday: 1)

// shortcuts
let newYearDay = now.beginningOfYear
let timeLimit = now.endOfHour
```

### Time zone

```swift
let now = Date()
let cst = NSTimeZone(name: "CST")!
let dateInCST = now.beginningOfDay.change(timeZone: cst)!
dateInCST.timeZone //=> CST (CDT) offset -18000 (Daylight)
```

### Format and parse

```swift
5.minutes.later.stringFromFormat("yyyy-MM-dd HH:mm:SS")
//=> "2015-03-01 12:05:00"

"1987-06-02".dateFromFormat("yyyy-MM-dd")
//=> Date.date(year: 1987, month: 6, day: 2)
```

### Compare dates

```swift
firstCommitDate < 1.year.ago // false
(1.year.ago...now).contains(firstCommitDate) // true
firstCommitDate > now // false
```

## Installation

### CocoaPods

```ruby
# Podfile
pod "Timepiece"
```

### Carthage

```ruby
# Cartfile
github "naoty/Timepiece"
```

## Contribution

1. Fork
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## License

Timepiece is available under the MIT license. See the LICENSE file for more info.

## Author

[naoty](https://github.com/naoty)
