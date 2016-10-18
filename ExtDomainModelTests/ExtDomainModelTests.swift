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
    
    func testMoney() {
        let tenUSD = Money(amount: 10, currency: .USD)
        let fifteenGBP = Money(amount: 15, currency: .GBP)
        
        // money description
        XCTAssert(tenUSD.description == "USD10.0")
        XCTAssert(fifteenGBP.description == "GBP15.0")
        
        // add
        let fourtyUSD = tenUSD + fifteenGBP
        XCTAssert(fourtyUSD.description == "USD40.0", fourtyUSD.description)
        
        // minus
        let tenGBP = fifteenGBP - tenUSD
        XCTAssert(tenGBP.description == Money(amount: 10, currency: .GBP).description, tenGBP.description)
        
        // double extension
        let x = 10.4.USD + 32.1.GBP
        XCTAssert(x.description == "USD42.5", x.description)
        
        let y = 45.0.EUR - 21.0.CAN
        XCTAssert(y.description == "EUR36.0", y.description)
        
    }
    
    func testJobPersonFamily() {
        // salary job description
        let csgoPro = Job(title: "CS:GO Pro", type: .Salary(500))
        XCTAssert(csgoPro.description == "Title: CS:GO Pro Type: Salary(500)")
        
        // hourly job description
        let macDee = Job(title: "MickeyDs", type: .Hourly(10.0))
        XCTAssert(macDee.description == "Title: MickeyDs Type: Hourly(10.0)", macDee.description)
        
        // first, last, age, no job, no spouse description
        let maleHuman = Person(firstName: "Simba", lastName: "the Lion", age: 22)
        XCTAssert(maleHuman.description == "[Person: firstName:Simba lastName:the Lion age:22 job:nil spouse:nil]", maleHuman.description)
        
        // first, last, age, job, no spouse description
        maleHuman.job = csgoPro
        XCTAssert(maleHuman.description == "[Person: firstName:Simba lastName:the Lion age:22 job:CS:GO Pro spouse:nil]", maleHuman.description)
        
        let femaleHuman = Person(firstName: "Nala", lastName: "the Lioness", age: 16)
        
        let family = Family(spouse1: maleHuman, spouse2: femaleHuman)
        
        // first, last, age, job, spouse description
        XCTAssert(maleHuman.description == "[Person: firstName:Simba lastName:the Lion age:22 job:CS:GO Pro spouse:Nala the Lioness]", maleHuman.description)
        
        XCTAssert(femaleHuman.description == "[Person: firstName:Nala lastName:the Lioness age:16 job:nil spouse:nil]", femaleHuman.description)
        
        // family description
        XCTAssert(family.description == "Name: Simba the Lion Name: Nala the Lioness ", family.description)
    }
}
