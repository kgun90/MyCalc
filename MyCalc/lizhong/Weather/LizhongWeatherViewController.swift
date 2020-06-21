//
//  LizhongWeatherController.swift
//  MyCalc
//
//  Created by ChungHyun Lee on 2020/06/20.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import UIKit

class LizhongWeatherViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        WeatherDataSource.shared.fetchSummary(lat: 60, lon: 125) {
            [weak self] in self?.completion()
        }
    }
}

/*extension LizhongWeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            //let cell = tableView.dequeueReusableCell(withIdentifier: //SummaryTableViewCell.identifier, for: indexPath) as! //SummaryTableViewCell
            
            //return cell
            
           return tableView
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}
*/
extension LizhongWeatherViewController {
    
    func completion() {
        if WeatherDataSource.shared.summary != nil {
            print("성공")
                   }
    }
}
