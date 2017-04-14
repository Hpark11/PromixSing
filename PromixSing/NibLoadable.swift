//
//  NibLoadable.swift
//  PromixSing
//
//  Created by Hyunsoo Park on 4/14/17.
//  Copyright © 2017 Hyunsoo Park. All rights reserved.
//

import UIKit

protocol NibLoadable: class {}

extension NibLoadable where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}

