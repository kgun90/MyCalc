//
//  SummaryTableViewCell.swift
//  MyCalc
//
//  Created by ChungHyun Lee on 2020/07/12.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import UIKit

class SummaryTableViewCell: UITableViewCell {
    
    static let identifier = "SummaryTableViewCell"
    
    
    @IBOutlet var weatherImageView: UIImageView!
    
    @IBOutlet var statusLabel: UILabel!
    
    @IBOutlet var maxMaxLabel: UILabel!

    @IBOutlet var currentTemperatureLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
