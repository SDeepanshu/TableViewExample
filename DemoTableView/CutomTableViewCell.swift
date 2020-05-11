//
//  CutomTableViewCell.swift
//  DemoTableView
//
//  Created by Rahul Sharma on 28/04/20.
//  Copyright © 2020 3Embed. All rights reserved.
//

import UIKit

class CutomTableViewCell: UITableViewCell {

    @IBOutlet var testingLabel: UILabel!
    
    @IBOutlet var customView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        customView.layer.cornerRadius = 64/2
        customView.layer.masksToBounds = true
        customView.layer.borderWidth = 2
        customView.layer.borderColor = UIColor.orange.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func playAnimation() {
        UIView.animate(withDuration: 0.25, animations: {
            self.customView.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1)
        }) { (finish) in
            UIView.animate(withDuration: 0.25) {
                self.customView.layer.transform = CATransform3DMakeScale(1, 1, 1)
            }
        }
    }
    
    
    
}
