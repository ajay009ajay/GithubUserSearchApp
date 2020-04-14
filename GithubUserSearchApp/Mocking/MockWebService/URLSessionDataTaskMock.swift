//
//  URLSessionDataTaskMock.swift
//  GithubUserSearchApp
//
//  Created by user on 4/14/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

class URLSessionDataTaskMock: URLSessionDataTask {
    private let closure: () -> Void
    
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    // We override the 'resume' method and simply call our closure
    // instead of actually resuming any task.
    override func resume() {
        closure()
    }
}
