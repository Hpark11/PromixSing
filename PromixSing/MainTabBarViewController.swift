//
//  MainTabBarViewController.swift
//  PromixSing
//
//  Created by Hyunsoo Park on 4/14/17.
//  Copyright © 2017 Hyunsoo Park. All rights reserved.
//

import UIKit
import Material

class MainTabBarViewController: PageTabBarController {
    open override func prepare() {
        super.prepare()
        
        delegate = self
        preparePageTabBar()
    }
}

extension MainTabBarViewController {
    fileprivate func preparePageTabBar() {
        pageTabBar.lineAlignment = .bottom
        pageTabBar.lineColor = Color.grey.darken1
    }
}

extension MainTabBarViewController: PageTabBarControllerDelegate {
    func pageTabBarController(pageTabBarController: PageTabBarController, didTransitionTo viewController: UIViewController) {
        print("pageTabBarController", pageTabBarController, "didTransitionTo viewController:", viewController)
    }
}
