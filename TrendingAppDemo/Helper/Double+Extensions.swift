//
//  Double+Extensions.swift
//  TrendingAppDemo
//
//  Created by Belkheir Oussama on 29/04/2019.
//  Copyright © 2019 Belkheir Oussama. All rights reserved.
//

import Foundation

extension BinaryInteger {
    var digits: [Int] {
        return String(describing: self).compactMap { Int(String($0)) }
    }
}

extension Double {

    var abreviatedNumber: String {
        let oneThousand: Double = 1000
        let oneMillion: Double = 1000000

        var quotion = 0
        var unit: String = ""
        var leftOver: Int = 0

        if(self < oneThousand) {
            quotion = Int(self)
        } else if (self >= oneThousand && self < oneMillion) {
            quotion = Int((self / oneThousand))
            leftOver = Int(self) % Int(oneThousand)
            unit = "K"
        }  else {
            quotion = Int((self / oneMillion))
            leftOver = Int(self) % Int(oneMillion)
            unit = "M"
        }
        let leftOverFirstDigit = leftOver.digits[0]
        let stringLeftOver: String = (leftOver > 0) ? "\(leftOverFirstDigit)" : ""

        let includeDotString  = (self > oneThousand) ? "." : ""

        return "\(quotion)\(includeDotString)\(stringLeftOver)\(unit)"
    }
}
