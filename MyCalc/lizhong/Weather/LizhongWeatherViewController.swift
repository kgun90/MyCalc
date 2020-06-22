//
//  LizhongWeatherController.swift
//  MyCalc
//
//  Created by ChungHyun Lee on 2020/06/20.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import UIKit
import CoreLocation

class LizhongWeatherViewController : UIViewController {
    
    lazy var locationManager: CLLocationManager = {
        let m = CLLocationManager()
        m.delegate = self
        return m
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        WeatherDataSource.shared.fetchSummary(lat: 37.4769484, lon: 126.9434709) {
            [weak self] in self?.completion()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .authorizedAlways, .authorizedWhenInUse:
                updateCurrentLocation()
            case .denied, .restricted:
                show(message: "위치 서비스 사용 불가")
            @unknown default:
                fatalError()
            }
        } else {
            show(message: "위치 서비스 사용 불가")
        }
    }
}

extension LizhongWeatherViewController: CLLocationManagerDelegate {
    
    func updateCurrentLocation() {
        locationManager.startUpdatingLocation()
    }
    
    
    //배터리 성능 고려
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        show(message: error.localizedDescription)
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            updateCurrentLocation()
        default:
            break
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
