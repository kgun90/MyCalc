//
//  MainViewController.swift
//  MyCalc
//
//  Created by Geon Kang on 2020/03/29.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    @IBAction func buttonAction(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        
        var storyBoardName = ""
        var viewControllerIdentifier = ""
        
        switch button.tag {
        case 0:
        // "Arthur"의 뷰 컨트롤러로 이동
            let viewController = SearchViewController()
            let viewModel = SearchViewModel()
            viewController.bind(viewModel)
            self.navigationController?.pushViewController(viewController, animated: true)
            return
        case 1:
        // "Paduck"의 뷰 컨트롤러로 이동
            storyBoardName = "WMain"
            viewControllerIdentifier = "Paduck_WeatherViewController"
            break
        case 2:
        // "Gun"의 뷰 컨트롤러로 이동
            storyBoardName = "Gun_Giphy"
            viewControllerIdentifier = "Gun_GiphyViewController"
        case 3:
        // "Lizhong"의 뷰 컨트롤러로 이동
            storyBoardName = "LizhongGiphySec"
            viewControllerIdentifier = "LizhongGiphySecViewController"
        default:
            break
        }
        
        let storyboard = UIStoryboard.init(name: storyBoardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: viewControllerIdentifier)
   
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
