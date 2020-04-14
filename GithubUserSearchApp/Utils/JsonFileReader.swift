//
//  JsonFileReader.swift
//  GithubUserSearchApp
//
//  Created by user on 4/14/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

/*
 This class is using for read json file for mocking purpose
 */
class JsonFileReader {
    
    static func getJsonFileData(fileName: String)-> Data? {
        
        var jsonData: Data?
        
        if let filepath = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let url = URL(fileURLWithPath: filepath)
                
                do {
                    jsonData = try?Data(contentsOf: url)
                }
            }
        }
        return jsonData
    }
    
}
