//
//  Reusable.swift
//  PromixSing
//
//  Created by Hyunsoo Park on 4/14/17.
//  Copyright © 2017 Hyunsoo Park. All rights reserved.
//

import UIKit

protocol Reusable: class {}

extension Reusable where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension Reusable where Self: UIViewController {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
