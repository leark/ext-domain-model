//
//  ExtDomainModelTests.swift
//  ExtDomainModelTests
//
//  Created by iGuest on 10/17/16.
//  Copyright © 2016 SeungLee. All rights reserved.
//

import XCTest

import ExtDomainModel

class ExtDomainModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let tenUSD = Money(amount: 10, currency: .USD)
        let fifteenGBP = Money(amount: 15, currency: .GBP)
        
        XCTAssert(tenUSD.description == "USD10")
        XCTAssert(fifteenGBP.description == "GBP15")
        
        /*
        let fiveUSD = fifteenUSD - tenUSD
        XCTAssert(fiveUSD == Money(amount: 5, currency: .USD))
         */
        
        let csgoPro = Job(title: "CS:GO Pro", type: .Salary(500))
        XCTAssert(csgoPro.description == "Title: CS:GO Pro Type: Salary(500)")
        
        let maleHuman = Person(firstName: "Simba", lastName: "the Lion", age: 21)
        maleHuman.job = csgoPro
        XCTAssert(maleHuman.description == "[Person: firstName:Simba lastName:the Lion age:21 job:CS:GO Pro spouse:nil]")
        
        let femaleHuman = Person(firstName: "Nala", lastName: "the Lioness", age: 21)
        
        let family = Family(spouse1: maleHuman, spouse2: femaleHuman)
        
        XCTAssert(family.description == "Name: Simba the Lion Name: Nala the Lioness")
    }

    func testClassExample() {
    }    
}
