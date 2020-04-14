//
//  SearchTableViewCell.swift
//  GithubUserSearchApp
//
//  Created by user on 4/14/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userThumbImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func drawCell(userData: UserModel)  {
        userNameLabel.text = userData.login
    }

}
