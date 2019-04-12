//
//  api_demoTests.swift
//  api_demoTests
//
//  Created by John on 4/11/19.
//  Copyright © 2019 JAMorales. All rights reserved.
//

import XCTest
@testable import api_demo

class api_demoTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDataDefault() {
        let d = DataModel()
        XCTAssert(d.movieList.count == 3)
    }

}
