//
//  Ext+UITableViewCell.swift
//  
//
//  Created by polykuzin on 10/11/2022.
//

import UIKit

public extension UITableViewCell {
    
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
