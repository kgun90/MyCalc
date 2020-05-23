//
//  Setting.swift
//  MyCalc
//
//  Created by ChungHyun Lee on 2020/05/23.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import GiphyUISDK

protocol Setting {
    static var title: String { get }
    static var cellId: String { get }
    static var itemCount: Int { get }
    static var itemHeight: CGFloat { get }
    static var columns: Int { get }
    var type: Setting.Type { get }
    var cases: [Any] { get }
    var string: String { get }
}

enum ConfirmationScreenSetting: Int {
    case off
    case on
    
    static var defaultSetting: ConfirmationScreenSetting {
        return .off
    }
}

enum ContentTypeSetting: Int {
    case multiple
    case single
}
