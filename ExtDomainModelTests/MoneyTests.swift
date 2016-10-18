//
//  MoneyTests.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import XCTest

import ExtDomainModel

//////////////////
// MoneyTests
//
class MoneyTests: XCTestCase {
    
    let tenUSD = Money(amount: 10, currency: .USD)
    let twelveUSD = Money(amount: 12, currency: .USD)
    let fiveGBP = Money(amount: 5, currency: .GBP)
    let fifteenEUR = Money(amount: 15, currency: .EUR)
    let fifteenCAN = Money(amount: 15, currency: .CAN)

    func testAddUSDtoUSD() {
        let total = tenUSD + tenUSD
        XCTAssert(total.amount == 20)
        XCTAssert(total.currency == .USD)
    }
    
    func testAddUSDtoGBP() {
        let total = tenUSD + fiveGBP
        XCTAssert(total.amount == 10)
        XCTAssert(total.currency == .GBP)
    }
    
    func testSubUSDfromUSD() {
        let total = twelveUSD - tenUSD
        XCTAssert(total.amount == 2)
        XCTAssert(total.currency == .USD)
    }
}

