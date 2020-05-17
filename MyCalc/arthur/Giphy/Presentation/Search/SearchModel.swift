//
//  SearchModel.swift
//  MyCalc
//
//  Created by Arthur on 09/05/2020.
//  Copyright © 2020 Arthur. All rights reserved.
//

import Foundation
import RxSwift

struct SearchModel {
    let searchGifNetwork: SearchGifNetwork
    
    init(searchGifNetwork: SearchGifNetwork = SearchGifNetworkImpl()) {
        self.searchGifNetwork = searchGifNetwork
    }
    
    func getSearchResult(_ data:String) -> Observable<Result<SearchGif, SearchGifNetworkError>> {
        let params = ["keyword": data,
                      "pageCount" : 0] as [String : Any]
        return searchGifNetwork.getSearchGifList(params)
    }
    func fetchMoreData(_ data:(String, Int)) -> Observable<Result<SearchGif, SearchGifNetworkError>> {
        let params = ["keyword": data.0,
                      "pageCount" : data.1 + 1] as [String : Any]
        return searchGifNetwork.getSearchGifList(params)
    }
    
    

}
