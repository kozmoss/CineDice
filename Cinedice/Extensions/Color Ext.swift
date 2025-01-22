//
//  Color Ext.swift
//  Netflix
//
//  Created by samet on 7.12.2024.
//

import Foundation
import UIKit
extension UIColor {
    static var dynamicTextColor: UIColor {
        return UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return .white
            default:
                return .black
            }
        }
    }
}
