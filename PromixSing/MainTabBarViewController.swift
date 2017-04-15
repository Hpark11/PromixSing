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
    
    open override func prepare() {
        super.prepare()
        delegate = self
        preparePageTabBar()
        prepareFABButton()
        prepareFABMenu()
        prepareNotesFABMenuItem()
        prepareRemindersFABMenuItem()
        fabMenu.fabMenuItems = [notesFABMenuItem, remindersFABMenuItem]
    }
    
    fileprivate func prepareFABButton() {
        fabButton = FABButton(image: Icon.cm.add, tintColor: .white)
        fabButton.pulseColor = .white
        fabButton.backgroundColor = Color.red.base
    }
    
    fileprivate func prepareFABMenu() {
        fabMenu = FABMenu()
        fabMenu.fabButton = fabButton
        
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
        //transition(to: NotesViewController())
        fabMenu.close()
    }
    
    func handleRemindersFABMenuItem(button: UIButton) {
        //transition(to: RemindersViewController())
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
