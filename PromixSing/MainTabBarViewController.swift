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
    
    fileprivate let fabMenuSize = CGSize(width: 56, height: 56)
    fileprivate let bottomInset: CGFloat = 64
    fileprivate let rightInset: CGFloat = 14
    
    fileprivate var fabButton: FABButton!
    fileprivate var fabMenu: FABMenu!
    
    fileprivate var notesFABMenuItem: FABMenuItem!
    fileprivate var remindersFABMenuItem: FABMenuItem!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pageTabBar.isHidden = false
    }
    
    open override func prepare() {
        super.prepare()
        delegate = self
        preparePageTabBar()
        prepareFABButton()
        prepareNotesFABMenuItem()
        prepareRemindersFABMenuItem()
        prepareFABMenu()
    }
    
    fileprivate func prepareFABButton() {
        fabButton = FABButton(image: Icon.cm.add, tintColor: .white)
        fabButton.pulseColor = .white
        fabButton.backgroundColor = Color.red.base
    }
    
    fileprivate func prepareFABMenu() {
        fabMenu = FABMenu()
        fabMenu.fabButton = fabButton
        fabMenu.fabMenuItems = [notesFABMenuItem, remindersFABMenuItem]
        
        view.layout(fabMenu)
            .size(fabMenuSize)
            .bottom(bottomInset)
            .right(rightInset)
    }
    
    fileprivate func prepareNotesFABMenuItem() {
        notesFABMenuItem = FABMenuItem()
        notesFABMenuItem.title = "Audio Library"
        notesFABMenuItem.fabButton.image = Icon.cm.pen
        notesFABMenuItem.fabButton.tintColor = .white
        notesFABMenuItem.fabButton.pulseColor = .white
        notesFABMenuItem.fabButton.backgroundColor = Color.green.base
        notesFABMenuItem.fabButton.addTarget(self, action: #selector(handleNotesFABMenuItem), for: .touchUpInside)

    }
    
    fileprivate func prepareRemindersFABMenuItem() {
        remindersFABMenuItem = FABMenuItem()
        remindersFABMenuItem.title = "Reminders"
        remindersFABMenuItem.fabButton.image = Icon.cm.bell
        remindersFABMenuItem.fabButton.tintColor = .white
        remindersFABMenuItem.fabButton.pulseColor = .white
        remindersFABMenuItem.fabButton.backgroundColor = Color.blue.base
        remindersFABMenuItem.fabButton.addTarget(self, action: #selector(handleRemindersFABMenuItem), for: .touchUpInside)
    }
}

extension MainTabBarViewController {
    func handleNotesFABMenuItem(button: UIButton) {
        fabMenu.close()
    }
    
    func handleRemindersFABMenuItem(button: UIButton) {
        let recordPromiseViewController = UIViewController.register(RecordPromiseByManualViewController.self)
        self.addChildViewController(recordPromiseViewController)
        recordPromiseViewController.view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        self.view.addSubview(recordPromiseViewController.view)
        recordPromiseViewController.view.alpha = 0
        
        UIView.animate(withDuration: 0.6) {
            recordPromiseViewController.view.alpha = 1
        }
        
        pageTabBar.isHidden = true
        fabMenu.close()
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
