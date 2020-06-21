//
//  WeatherSummary.swift
//  MyCalc
//
//  Created by ChungHyun Lee on 2020/06/20.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import Foundation


struct WeatherSummary: Codable {
    struct items: Codable {
        struct item: Codable {
            struct index: Codable {
                let category: String
                let obsrValue: Double
            }
           
        }
        
        let item: [item]
    }
}
