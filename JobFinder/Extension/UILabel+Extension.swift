//
//  UILabel+Extension.swift
//  JobFinder
//
//  Created by Naval Hasan on 20/03/22.
//

import Foundation
import UIKit

extension UILabel {
    // This extension is used to add padding for label
    // usage: LabelName.setMargins
    func setMargins(_ margin: CGFloat = 10) {
        if let textString = self.text {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.firstLineHeadIndent = margin
            paragraphStyle.headIndent = margin
            paragraphStyle.tailIndent = -margin
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
}
