//
//  ITunesApp_MVVM_Tests.swift
//  ITunesApp(MVVM)Tests
//
//  Created by Kuldeep Singh on 6/14/24.
//

import XCTest
@testable import ITunesApp_MVVM_

final class DataViewModelTests: XCTestCase {
    
    var apiClass: ApiClass!
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        apiClass = ApiClass.shared
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        apiClass = nil
    }

    func testAPIfetchImagewithInvalidUrl() {
//        apiClass.
    }

}
