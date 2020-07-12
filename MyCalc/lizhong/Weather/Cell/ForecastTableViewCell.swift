//
//  ForecastTableViewCell.swift
//  MyCalc
//
//  Created by ChungHyun Lee on 2020/07/12.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    
    static let identifier = "ForecastTableViewCell"
    
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var weatherImageView: UIImageView!
    
    @IBOutlet var statueLabel: UILabel!
    
    @IBOutlet var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
