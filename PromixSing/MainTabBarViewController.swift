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
        prepareFABButton()
    }
    
    fileprivate var fabButton: FABButton!
    fileprivate func prepareFABButton() {

        fabButton = FABButton(image: Icon.cm.add, tintColor: .white)
        fabButton.frame.size.height = 56
        fabButton.frame.size.width = 56
        
        fabButton.center = CGPoint(x: view.frame.width - 48, y: view.frame.height - 96)
        
        fabButton.pulseColor = .white
        fabButton.backgroundColor = Color.red.base
        view.addSubview(fabButton)
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
