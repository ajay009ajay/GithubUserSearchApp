//
//  GithubUserSearchAppUITests.swift
//  GithubUserSearchAppUITests
//
//  Created by user on 4/14/20.
//  Copyright © 2020 user. All rights reserved.
//

import XCTest

class GithubUserSearchAppUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
//
//    func testExample() {
//        // Use recording to get started writing UI tests.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
    
    func stepToFieldValidation()  {
        Thread.sleep(forTimeInterval: 5)
        XCTAssertTrue(app.tables["UserSearchBar.Tableview"].exists, "TableView doesn't exist")
        
        let searhBar = app.otherElements["UserSearchBar"]
        XCTAssertTrue(searhBar.exists, "Searchbar doesn't exist")
        
        let searchfield = app.searchFields.element(boundBy: 0)
        searchfield.tap()
        searchfield.typeText("Ajay")
        Thread.sleep(forTimeInterval: 10)
    }
    
    func testSearchBarUsers()  {
        app.launchArguments = ["--GithubUserSearchMocking--"]
        app.launch()
        stepToFieldValidation()
    }
    
    func testForNoUserFoundValidation() {
        app.launchArguments = ["--GithubUserSearchMocking--","--NoUserFoundError--"]
        app.launch()
        
        Thread.sleep(forTimeInterval: 5)
        let searchfield = app.searchFields.element(boundBy: 0)
        searchfield.tap()
        searchfield.typeText("$")
        
        let noUserView = app.otherElements["NoUserFound.view"]
        
        XCTAssertTrue(noUserView.exists, "No User found UI doesn't exist")

    }

}
