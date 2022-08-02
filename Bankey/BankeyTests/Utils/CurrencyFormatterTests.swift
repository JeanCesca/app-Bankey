//
//  CurrencyFormatterTests.swift
//  BankeyTests
//
//  Created by Jean Ricardo Cesca on 01/08/22.
//

import Foundation
import XCTest
@testable import Bankey //importando o Bundle "Bankey"

class Test: XCTestCase {
    
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testBreakDollarsIntoCents() throws {
        //Valor de teste:
        let num: Decimal = 929466.23
        
        //Par a Função
        let result = formatter.breakIntoDollarsAndCents(num)
        
        //Testar:
        XCTAssertEqual(result.0, "929,466")
        XCTAssertEqual(result.1, "23")
    }
    
    func testDollarsFormatted() throws {
        //Valor de teste:
        let num: Double = 929466
        
        //Par a Função
        let result = formatter.dollarsFormatted(num)
        
        //Testar
        XCTAssertEqual(result, "$929,466.00")
    }
    
    func testZeroDollarsFormatted() throws {
        //Valor de teste:
        let num: Double = 0.00
        
        //Par a Função
        let result = formatter.dollarsFormatted(num)
        
        //Testar
        XCTAssertEqual(result, "$0.00")
    }
    
}
