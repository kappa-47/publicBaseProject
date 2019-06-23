//
//  Date+Formatter.swift
//  TiaIOS
//
//  Created by ibraheem abuhadba on 12/6/18.
//  Copyright © 2018 NSIT. All rights reserved.
//

import Foundation
extension Formatter {
    
    struct Date {
        static let iso8601: DateFormatter = {
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.locale = Locale.current
            formatter.timeZone = TimeZone.current
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            return formatter
        }()
    }
}

extension Date {
    var iso8601: String {
        return Formatter.Date.iso8601.string(from: self)
    }
}

extension String {
    var iso8601: Date? {
        return Formatter.Date.iso8601.date(from: self)
    }
}

extension ISO8601DateFormatter {
    convenience init(_ formatOptions: Options, timeZone: TimeZone? = nil) {
        self.init()
        self.formatOptions = formatOptions
        self.timeZone = timeZone ?? TimeZone(secondsFromGMT: 0)
    }
}
