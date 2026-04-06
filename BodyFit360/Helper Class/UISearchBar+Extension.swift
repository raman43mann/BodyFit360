//
//  UISearchBar+Extension.swift
//  BodyFit360
//

import UIKit

extension UISearchBar {

    func setBackgroundColor(_ color: UIColor) {
        UIGraphicsBeginImageContext(self.frame.size)
        color.setFill()
        UIBezierPath(rect: self.frame).fill()
        let bgImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        setSearchFieldBackgroundImage(bgImage, for: .normal)
        backgroundImage = UIImage()
        layer.cornerRadius = frame.size.height / 2
        layer.masksToBounds = true
    }
}
