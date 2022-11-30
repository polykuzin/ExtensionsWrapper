//
//  Ext+Bundle.swift
//  
//
//  Created by polykuzin on 10/11/2022.
//

import UIKit

public extension Bundle {

    static func loadView<T>(fromNib name: String, withType type: T.Type) -> T {
        if let view = Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.first as? T {
            return view
        }

        fatalError("Could not load view with type " + String(describing: type))
    }
}
