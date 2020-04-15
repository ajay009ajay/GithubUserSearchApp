//
//  UserSearchViewModel.swift
//  GithubUserSearchApp
//
//  Created by user on 4/14/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import UIKit

class UserSearchViewModel: NSObject {
 
    private let githubUserWebService: WebServiceManager
    private var pageNumber = CommonSetting.startPageNumber
    private var users = [UserModel]()
    
    var isUserDataUpdated: Box<Bool> = Box(false)
    var isErrorOccured: Box<CustomError?> = Box(nil)

    init(githubUserWebService: WebServiceManager) {
        self.githubUserWebService = githubUserWebService
    }
}

extension UserSearchViewModel {
    
    private func clearUserData() {
        users.removeAll()
        isUserDataUpdated.value = true
    }
    
    func getGithubUser(searchText: String, pageNumber:Int = 1) {
        
        if searchText.count <= 0 {
            clearUserData()
            return
        }
        
        githubUserWebService.getGithubUsersBySearchText(searchText: searchText, pageNumber: pageNumber) { [weak self] (userArr, error) in
            
            if let error = error {
                self?.isErrorOccured.value = error
                return
            }
            
            if let allUsers = userArr, allUsers.count > 0 {
                if pageNumber != CommonSetting.startPageNumber {
                    self?.users.append(contentsOf: allUsers)
                } else {
                    self?.users = allUsers
                    self?.pageNumber = CommonSetting.startPageNumber
                }
                self?.isUserDataUpdated.value = true
            } else {
                self?.isErrorOccured.value = CustomError.noResultFoundError
            }
        }
    }
    
    func getNextPageGithubUserForSerachText(searchText: String) {
        pageNumber += 1
        getGithubUser(searchText: searchText, pageNumber: pageNumber)
    }
    
//    func getGithubUserFromLocalCached(searchText: String) {
//
//        if searchText.count <= 0 {
//            clearUserData()
//            return
//        }
//        let newArr = users.filter { $0.login.lowercased().contains(searchText.lowercased())}
//        users = newArr
//        isUserDataUpdated.value = true
//    }
}


extension UserSearchViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        let userModelData = users[indexPath.row]
        cell.drawCell(userData: userModelData)
        return cell
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
}

