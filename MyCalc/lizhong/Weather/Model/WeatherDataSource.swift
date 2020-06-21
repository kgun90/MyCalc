//
//  WeatherDataSource.swift
//  MyCalc
//
//  Created by ChungHyun Lee on 2020/06/20.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import UIKit

class WeatherDataSource {
    static let shared = WeatherDataSource()
    private init() {}
    
    var summary: WeatherSummary?
    var forecastList = [Any]()
    
    func fetchSummary(lat: Double, lon: Double, completion: @escaping () -> ()) {
        
        let apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getUltraSrtNcst?serviceKey=\(appKey)&pageNo=1&numOfRows=10&dataType=json&base_date=20200620&base_time=2000&nx=\(lat)&ny=\(lon)&"
        
        print(apiUrl)

        let url = URL(string: apiUrl)!

        let session = URLSession.shared

        let task = session.dataTask(with: url) { (data, response, error) in
            
            
            defer {
                DispatchQueue.main.async {
                    completion()
                }
            }
            
            if let error = error {
                print(error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid Response")
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                print("/(httpResponse.statusCode)")
                return
            }
            
            guard let data = data else {
                fatalError("Invalid data")
            }
            
            do {
                
                let decoder = JSONDecoder()
                self.summary = try decoder.decode(WeatherSummary.self, from: data)
                
                print(self.summary ?? "null")
                
            } catch {
                print(error)
            }
        }

        task.resume()
    }
}
