//
//  Constant.swift
//  GithubUserSearchApp
//
//  Created by user on 4/14/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

enum CommonSetting {
    static let perPage = 50
    static let startPageNumber = 1
}

enum HTTPUrl {
    static let githubBaseUrl = "https://api.github.com/search/users?"
}


enum CustomError: Error {
    case httpResponseError
    case jsonDecoingError
    case dataError
    case httpServerError
    case noResultFoundError
}

//enum TableViewConstant {
//    static let userSearchTableViewHeight: CGFloat = 130
//}
