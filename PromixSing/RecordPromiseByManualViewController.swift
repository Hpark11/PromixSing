//
//  RecordPromiseByManualViewController.swift
//  PromixSing
//
//  Created by Hyunsoo Park on 16/04/2017.
//  Copyright © 2017 Hyunsoo Park. All rights reserved.
//

import UIKit

class RecordPromiseByManualViewController: UIViewController {

    @IBAction func button(_ sender: Any) {
        if let parent = self.parent as? MainTabBarViewController {
            parent.pageTabBar.isHidden = false
        }
        self.view.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    }
}
