//
//  Date+Extension.swift
//  TrendingAppDemo
//
//  Created by Belkheir Oussama on 29/04/2019.
//  Copyright © 2019 Belkheir Oussama. All rights reserved.
//

import Foundation

extension Date {

    func remove(numberOfDays: Int) -> Date {
        let previousDate = Calendar.current.date(byAdding: .day, value: -numberOfDays, to: self)
        return previousDate ?? Date()
    }

    func toString(format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
