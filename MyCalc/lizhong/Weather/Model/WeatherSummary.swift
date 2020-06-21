//
//  WeatherSummary.swift
//  MyCalc
//
//  Created by ChungHyun Lee on 2020/06/20.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import Foundation


/*struct WeatherSummary: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let header: Header
    let body: Body
}

// MARK: - Body
struct Body: Codable {
    let dataType: String
    let items: Items
    let pageNo, numOfRows, totalCount: Int
}

// MARK: - Items
struct Items: Codable {
    let item: [Item]
}

// MARK: - Item
struct Item: Codable {
    let baseDate, baseTime, category: String
    let nx, ny: Int
    let obsrValue: String
}

// MARK: - Header
struct Header: Codable {
    let resultCode, resultMsg: String
}
 */


struct WeatherSummary: Codable {
    struct Response: Codable {
        struct Header: Codable {
            let resultCode: String
            let resultMsg: String
        }
        struct Body: Codable {
            struct Items: Codable {
                struct Item: Codable {
                    let baseDate, baseTime, category: String
                    let nx, ny: Int
                    let obsrValue: String
                }
                let item: [Item]
            }
            let dataType: String
            let items: Items
            let pageNo, numOfRows, totalCount: Int
        }
        let header: Header
        let body: Body
    }
    let response: Response
}
