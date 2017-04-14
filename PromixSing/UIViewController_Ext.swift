//
//  UIViewController_Ext.swift
//  PromixSing
//
//  Created by Hyunsoo Park on 4/14/17.
//  Copyright © 2017 Hyunsoo Park. All rights reserved.
//

import UIKit

extension UIViewController : Reusable {
    class func register<T: UIViewController>(_: T.Type) -> T {
        print(T.reuseIdentifier)
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError(":: Unable to instantiate viewController : \(T.reuseIdentifier)")
        }
        return vc
    }
}
