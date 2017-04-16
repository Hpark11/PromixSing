//
//  UICollectionView_Ext.swift
//  PromixSing
//
//  Created by Hyunsoo Park on 16/04/2017.
//  Copyright © 2017 Hyunsoo Park. All rights reserved.
//

import UIKit

extension UICollectionViewCell: Reusable {}

extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError(":: Unable to dequeue cell with identifier : \(T.reuseIdentifier)")
        }
        return cell
    }
}
