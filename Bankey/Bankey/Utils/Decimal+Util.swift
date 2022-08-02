//
//  DecimalUtil.swift
//  Bankey
//
//  Created by Jean Ricardo Cesca on 29/07/22.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
    
    
}
