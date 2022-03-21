//
//  UIView+Extension.swift
//  JobFinder
//
//  Created by Naval Hasan on 17/03/22.
//

import Foundation
import UIKit

extension UIView {
    // This function is used to add border to UIView
    // Usage: viewInstance.addBorder(cornerRadius: 10, borderColor: .red)
    func addBorder(cornerRadius: Float, borderColor: UIColor) {
        self.clipsToBounds = false
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = true
    }
    
    // This function is used to add shadow to UIView
    // Usage: viewInstance.dropShadow(cornerRadius: 10)
    func dropShadow(cornerRadius: Float) {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 3)
        layer.masksToBounds = false
        layer.cornerRadius = CGFloat(cornerRadius)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 3
        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = true
    }
}
