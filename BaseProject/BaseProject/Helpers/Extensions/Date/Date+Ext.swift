//
//  Date+Ext.swift
//
//
//  Created by Moayad Al kouz on 7/1/18.
//  Copyright © 2018 Moayad Al kouz. All rights reserved.

import Foundation

extension Date {
    var startOfWeek: Date {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))!
    }
    
    func startOfSpecificWeek(week: Date) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: week))!
    }
    
    func endOfSpecificWeek(week: Date) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: week))!
    }
    
    func nextDayToSpecificDate(numberOfDays: Int,date: Date) -> Date{
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(byAdding: .day, value: numberOfDays, to: date.midNight)!
    }
    
    func weeksAgo(numberOfWeeks: Int) -> Date{
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(byAdding: .weekOfYear, value: -numberOfWeeks, to: midNight)!
    }
    
    func nextWeeks(numberOfWeeks: Int) -> Date{
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(byAdding: .weekOfYear, value: numberOfWeeks, to: midNight)!
    }
    
    func prevDay(numberOfDays: Int) -> Date{
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(byAdding: .day, value: -numberOfDays, to: midNight)!
    }
    
    func nextDay(numberOfDays: Int) -> Date{
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(byAdding: .day, value: numberOfDays, to: midNight)!
    }
    
    func nextYear(numberOfDays: Int) -> Date{
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(byAdding: .year, value: numberOfDays, to: midNight)!
    }
    
    var yesterday: Date {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(byAdding: .day, value: -1, to: midNight)!
    }
    var tomorrow: Date {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(byAdding: .day, value: 1, to: midNight)!
    }
    
    var weekOfYear: Int {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.component(.weekOfYear,  from: self)
    }
    
    var midNight: Date {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(bySettingHour: 0, minute: 0, second: 0, of: self)!
    }
    
    var noon: Date {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.component(.month,  from: self)
    }
    
    var hour: Int {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        return calendar.component(.hour,  from: self)
    }
    
    var minute: Int {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.component(.minute,  from: self)
    }
    
    var isLastDayOfMonth: Bool {
        return tomorrow.month != month
    }
    
    var formatted: String{
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current//TimeZone(secondsFromGMT: 0)
        //        formatter.dateFormat = "yyyy-MM-ddd hh:mm:ss a"
        formatter.dateFormat = "EEE\ndd-MM"
        return formatter.string(for: self)!
    }
    
    var thisWeekDates: [Date]{
        var dates = [Date]()
        let startDate = self.startOfWeek
        dates.append(startDate)
        dates.append(startDate.nextDay(numberOfDays: 1))
        dates.append(startDate.nextDay(numberOfDays: 2))
        dates.append(startDate.nextDay(numberOfDays: 3))
        dates.append(startDate.nextDay(numberOfDays: 4))
        
        return dates
    }
    
    var weekDay: Int{
        let calendar = Calendar(identifier: .gregorian)
        return calendar.component(.weekday,  from: self)
    }
    
    var yearDay: Int{
        let calendar = Calendar(identifier: .gregorian)
        
        return calendar.ordinality(of: .day, in: .year, for: self)!
    }
    
    func setTime(date: Date) -> Date?{
        let calendar = Calendar(identifier: .gregorian)
        
        let comps = calendar.dateComponents([.hour, .minute], from: date)
        return calendar.date(bySettingHour: comps.hour ?? 0, minute: comps.minute ?? 0, second: 0, of: self)
    }
}


