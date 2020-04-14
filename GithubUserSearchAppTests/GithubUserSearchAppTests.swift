//
//  GithubUserSearchAppTests.swift
//  GithubUserSearchAppTests
//
//  Created by user on 4/14/20.
//  Copyright © 2020 user. All rights reserved.
//

import XCTest
@testable import GithubUserSearchApp

class GithubUserSearchAppTests: XCTestCase {

    var githubSearchVC: UserSearchViewController!
    var mockSession = URLSessionMock()
    var webManager: WebServiceManager?
    var viewModel: UserSearchViewModel?
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: UserSearchViewController = storyboard.instantiateViewController(withIdentifier: "UserSearchViewController") as! UserSearchViewController
        githubSearchVC = vc
        githubSearchVC.loadView()
        
        webManager = WebServiceManager(session: mockSession)
        
        if let webManager = webManager  {
            viewModel = UserSearchViewModel(githubUserWebService: webManager)
            vc.viewModel = viewModel!
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    func testGithubSearchUser()  {
        mockSession.data = JsonFileReader.getJsonFileData(fileName: "Users")
        viewModel?.getGithubUser(searchText: "Ajay")
        
        let expection = expectation(description: "SearchGithubUsers")
        
        viewModel?.isUserDataUpdated.bind{ (data) in
            expection.fulfill()
        }
        
        waitForExpectations(timeout: 10) { [weak self] (error) in
            
            if let vm = self?.viewModel {
                XCTAssertTrue(vm.isUserDataUpdated.value, "User data should present in mocking")
                self?.githubSearchVC.userTableView.reloadData()
            }
        }
    }

}
