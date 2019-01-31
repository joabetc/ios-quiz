//
//  RegisteredTableViewCell.swift
//  Quiz
//
//  Created by retina on 29/01/19.
//  Copyright © 2019 retina. All rights reserved.
//

import UIKit

class RegisteredTableViewCell: UITableViewCell {

    @IBOutlet var question: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
