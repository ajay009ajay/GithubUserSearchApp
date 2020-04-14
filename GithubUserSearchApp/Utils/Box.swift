//
//  Box.swift
//  GithubUserSearchApp
//
//  Created by user on 4/14/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

class Box<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?)  {
        self.listener = listener
        listener?(value)
    }
}
