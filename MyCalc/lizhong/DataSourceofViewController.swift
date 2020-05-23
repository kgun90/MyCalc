//
//  DataSourceofViewController.swift
//  MyCalc
//
//  Created by ChungHyun Lee on 2020/05/23.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import UIKit
import GiphyUISDK
import GiphyCoreSDK

enum ChatUser: Int {
    case joo
    case joos
    
    var avatar: GiphyYYImage? {
        switch self {
        case .joo: return GiphyYYImage(contentsOfFile: Bundle.main.path(forResource: "joo", ofType: "gif") ?? "")
        case .joos: return GiphyYYImage(contentsOfFile: Bundle.main.path(forResource: "joos", ofType: "gif") ?? "")
        }
    }
    
    var isMe: Bool {
        switch self {
        case .joo: return false
        case .joos: return true
        }
    }
}

struct ChatMessage {
    var text: String?
    var user: ChatUser
    var media: GPHMedia?
    
    init(text: String? = "", user: ChatUser, media: GPHMedia? = nil) {
        self.text = text
        self.user = user
        self.media = media
    }
}

extension giphyViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let genericCell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatCell.id, for: indexPath)
        guard let cell = genericCell as? ChatCell else { return genericCell }
        let message = conversation[indexPath.item]
        cell.media = message.media
        cell.text = message.text
        cell.avatarImage = message.user.avatar
        cell.isReply = message.user == .joo
        cell.theme = settingsViewController.theme
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return conversation.count
    }
}

