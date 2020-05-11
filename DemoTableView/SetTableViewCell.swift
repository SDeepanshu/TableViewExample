//
//  TableViewCell.swift
//  DemoTableView
//
//  Created by Rahul Sharma on 28/04/20.
//  Copyright © 2020 3Embed. All rights reserved.
//

import UIKit

class SetTableViewCell: UITableViewCell {

    @IBOutlet weak var title:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func assigntext(text: String) {
        title.text = text
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
