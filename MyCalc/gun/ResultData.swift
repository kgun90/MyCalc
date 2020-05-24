//
//  ResultData.swift
//  MyCalc
//
//  Created by Geon Kang on 2020/05/16.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import Foundation

struct ResultData: Codable {
    let data: [searchResult]
    let pagination: Pagination

}
struct searchResult: Codable {
    let images: Images
    let type: String

}
struct Images: Codable {
    let fixed_height_small_still: Still
    struct Still: Codable {
        let url: String
    }
}
struct Pagination: Codable {
    let total_count: Int
    let count: Int
    let offset: Int
}
