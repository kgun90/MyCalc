//
//  WeatherSummary.swift
//  MyCalc
//
//  Created by ChungHyun Lee on 2020/06/20.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import Foundation


struct WeatherSummary: Codable {
    struct Coord: Codable {
        let lon, lat: Double
    }
    struct Weather: Codable {
        let id: Int
        let main, weatherDescription, icon: String

        enum CodingKeys: String, CodingKey {
            case id, main
            case weatherDescription = "description"
            case icon
        }
    }
    struct Main: Codable {
        let temp, feelsLike, tempMin, tempMax: Double
        let pressure, humidity: Int

        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case pressure, humidity
        }
    }
    struct Wind: Codable {
        let speed: Double
        let deg: Int
    }
    struct Clouds: Codable {
        let all: Int
    }
    struct Sys: Codable {
        let type, id: Int
        let country: String
        let sunrise, sunset: Int
    }
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}


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


/*struct WeatherSummary: Codable {
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
*/
