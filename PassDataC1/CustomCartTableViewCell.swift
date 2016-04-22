//
//  CustomCartTableViewCell.swift
//  PassDataC1
//
//  Created by admin on 3/30/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit

class CustomCartTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewProduct: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblQty: UILabel!
    @IBOutlet weak var stepperQty: UIStepper!

    @IBAction func AddQty(sender: UIStepper) {
        lblQty.text = Int(sender.value).description
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        stepperQty.wraps = true
        stepperQty.autorepeat = true
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
