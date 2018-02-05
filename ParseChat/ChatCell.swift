//
//  ChatCell.swift
//  ParseChat
//
//  Created by Harika Lingareddy on 2/5/18.
//  Copyright © 2018 Harika Lingareddy. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {
    
    @IBOutlet weak var uLabel: UILabel!
    @IBOutlet weak var cLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
