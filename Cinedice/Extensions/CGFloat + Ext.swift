//
//  CGFloat + Ext.swift
//  Netflix
//
//  Created by samet on 27.11.2024.
//

import Foundation
import UIKit

enum IconType {
    case system // For SF Symbols
    case image  // For custom images
}

extension UIViewController {
    var screenWidth : CGFloat {
        return view.frame.size.width
    }
    
    var screenHeight: CGFloat {
        return view.frame.size.height
    }
    

}

extension UIView {
    var screenWidth : CGFloat {
        return UIScreen.main.bounds.width
    }
    
    var screenHeight: CGFloat {
        return UIScreen.main.bounds.width
    }
}

