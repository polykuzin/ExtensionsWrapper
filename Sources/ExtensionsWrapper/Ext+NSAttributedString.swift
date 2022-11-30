//
//  Ext+NSAttributedString.swift
//  
//
//  Created by polykuzin on 16/11/2022.
//

import Foundation

public extension NSAttributedString {
    
    static func +(left: NSAttributedString, right: NSAttributedString) -> NSAttributedString {
        let result = NSMutableAttributedString()
        result.append(left)
        result.append(right)
        return result
    }
}
