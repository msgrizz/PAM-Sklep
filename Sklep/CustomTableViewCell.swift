//
//  CustomTableViewCell.swift
//  Sklep
//
//  Created by Rafael Takaka on 18.01.2018.
//  Copyright © 2018 Rafael Takaka. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var nazwa: UILabel!
    @IBOutlet var cena: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
