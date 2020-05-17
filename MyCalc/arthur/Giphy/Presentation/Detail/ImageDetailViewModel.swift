//
//  ImageDetailViewModel.swift
//  MyCalc
//
//  Created by Arthur on 09/05/2020.
//  Copyright © 2020 Arthur. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct ImageDetailViewModel: ImageDetailViewBinable {
    let imageData = PublishSubject<FavoriteCharacter>()
    let realmManager = RealmManager()

}
