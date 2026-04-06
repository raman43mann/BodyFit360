//
//  CustomView.swift
//  IBDesignable
//
//  Created by Ramanjeet Singh on 16/10/24.
//

import UIKit

@IBDesignable
class CustomView: UIView {

    // Add a corner radius property that can be customized in IB
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

    // Add a border width property that can be customized in IB
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }

    // Add a border color property that can be customized in IB
    @IBInspectable var borderColor: UIColor? {
        didSet {
            self.layer.borderColor = borderColor?.cgColor
        }
    }

    // Add a shadow color property that can be customized in IB
    @IBInspectable var shadowColor: UIColor? {
        didSet {
            self.layer.shadowColor = shadowColor?.cgColor
        }
    }

    // Add a shadow opacity property that can be customized in IB
    @IBInspectable var shadowOpacity: Float = 0.0 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }

    // Add a shadow offset property that can be customized in IB
    @IBInspectable var shadowOffset: CGSize = CGSize.zero {
        didSet {
            self.layer.shadowOffset = shadowOffset
        }
    }

    // Add a shadow radius property that can be customized in IB
    @IBInspectable var shadowRadius: CGFloat = 0.0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setNeedsLayout()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setNeedsLayout()
    }
}
