//
//  Ext+UIView.swift
//  
//
//  Created by polykuzin on 10/11/2022.
//

import UIKit

public enum Corners {
    case all
    case top
    case bottom
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
    case allButTopLeft
    case allButTopRight
    case allButBottomLeft
    case allButBottomRight
    case left
    case right
    case topLeftBottomRight
    case topRightBottomLeft
}

public extension UIView {
    
    class func fromNib(named: String? = nil) -> Self {
        let name = named ?? "\(Self.self)"
        guard
            let nib = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
            else { fatalError("missing expected nib named: \(name)") }
        guard
            /// we're using `first` here because compact map chokes compiler on
            /// optimized release, so you can't use two views in one nib if you wanted to
            /// and are now looking at this
            let view = nib.first as? Self
            else { fatalError("view of type \(Self.self) not found in \(nib)") }
        return view
    }
    
    /**
     Sets the cornerRadius for selected corners from **Corners** enum
     - parameters:
        - corners:
            * all
            * top
            * bottom
            * topLeft
            * topRight
            * bottomLeft
            * bottomRight
            * allButTopLeft
            * allButTopRight
            * allButBottomLeft
            * allButBottomRight
            * left
            * right
            * topLeftBottomRight
            * topRightBottomLeft
        - radius: The **CGFloat** value to be set
     */
    func roundCorners(_ corners: Corners, radius: CGFloat) {
        var cornerMasks = [CACornerMask]()
        
        // Top left corner
        switch corners {
        case .all, .top, .topLeft, .allButTopRight, .allButBottomLeft, .allButBottomRight, .topLeftBottomRight, .left:
            cornerMasks.append(CACornerMask(rawValue: UIRectCorner.topLeft.rawValue))
        default:
            break
        }
        
        // Top right corner
        switch corners {
        case .all, .top, .topRight, .allButTopLeft, .allButBottomLeft, .allButBottomRight, .topRightBottomLeft:
            cornerMasks.append(CACornerMask(rawValue: UIRectCorner.topRight.rawValue))
        default:
            break
        }
        
        // Bottom left corner
        switch corners {
        case .all, .bottom, .bottomLeft, .allButTopRight, .allButTopLeft, .allButBottomRight, .topRightBottomLeft, .left:
            cornerMasks.append(CACornerMask(rawValue: UIRectCorner.bottomLeft.rawValue))
        default:
            break
        }
        
        // Bottom right corner
        switch corners {
        case .all, .bottom, .bottomRight, .allButTopRight, .allButTopLeft, .allButBottomLeft, .topLeftBottomRight:
            cornerMasks.append(CACornerMask(rawValue: UIRectCorner.bottomRight.rawValue))
        default:
            break
        }
        
        clipsToBounds = true
        layer.cornerRadius = radius
        
        layer.maskedCorners = CACornerMask(cornerMasks)
        layer.cornerCurve = .continuous
    }
}
