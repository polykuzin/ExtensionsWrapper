//
//  Ext+UICollectionViewCell.swift
//  
//
//  Created by polykuzin on 15/11/2022.
//

import UIKit

public extension UICollectionViewCell {
    
    static func nib(_ bundle: Bundle? = nil) -> UINib {
        return UINib(
            nibName: reuseId,
            bundle: bundle
        )
    }
    
    static var reuseId : String {
        return String(describing: self)
    }
}
