//
//  UserTVCell.swift
//  MVVM
//
//  Created by Sharetrip-iOS on 18/08/2021.
//

import UIKit

class UserTVCell: UITableViewCell {

    @IBOutlet weak private var userInfoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func config(userInfoText: String) {
        self.userInfoLabel.text = userInfoText
    }
}
