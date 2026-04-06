//
//  UIViewExitension.swift
//  BodyFit360
//
//  Created by Ramanjeet Singh 
//
//

import UIKit

extension UIView {
    func addShadow(
        color: UIColor = .black,
        opacity: Float = 0.2,
        offset: CGSize = CGSize(width: 0, height: 2),
        radius: CGFloat = 4
    ) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false
    }
}

@IBDesignable class CustomBlurView: UIView {
    
    // Blur Effect Style property, default is light
    @IBInspectable var blurStyle: Int = 1 { // 1 = Light, 2 = Dark, 3 = ExtraLight
        didSet {
            updateBlurEffect()
        }
    }
    
    // Corner Radius property
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    private var blurEffectView: UIVisualEffectView?
    private var overlayView: UIView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBlurEffect()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupBlurEffect()
    }
    
    private func setupBlurEffect() {
        // Initialize blur effect and view
        let effect = UIBlurEffect(style: .light)
        blurEffectView = UIVisualEffectView(effect: effect)
        blurEffectView?.frame = self.bounds
        blurEffectView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        if let blurEffectView = blurEffectView {
            self.addSubview(blurEffectView)
        }
        
        // Initialize overlay with 30% opacity
        overlayView = UIView(frame: self.bounds)
        overlayView?.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        overlayView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        if let overlayView = overlayView {
            self.addSubview(overlayView)
        }
        
        // Apply corner radius if set
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = cornerRadius > 0
    }
    
    private func updateBlurEffect() {
        blurEffectView?.removeFromSuperview()
        
        let effect: UIBlurEffect
        switch blurStyle {
        case 2:
            effect = UIBlurEffect(style: .dark)
        case 3:
            effect = UIBlurEffect(style: .extraLight)
        default:
            effect = UIBlurEffect(style: .light)
        }
        
        blurEffectView = UIVisualEffectView(effect: effect)
        blurEffectView?.frame = self.bounds
        blurEffectView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        if let blurEffectView = blurEffectView {
            self.insertSubview(blurEffectView, at: 0)
        }
        
        // Ensure the overlay remains at 30% opacity
        overlayView?.backgroundColor = UIColor.white.withAlphaComponent(0.3)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        blurEffectView?.frame = self.bounds
        overlayView?.frame = self.bounds
        layer.cornerRadius = cornerRadius
    }
}


private enum BFValidationPredicates {
    static let password = NSPredicate(
        format: "SELF MATCHES %@",
        "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
    )
    static let email = NSPredicate(
        format: "SELF MATCHES %@",
        "[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[‌​a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"
    )
}

extension UIViewController {

    func alert(message: String) {
        let presentAlert = {
            let alertView = UIAlertController(
                title: NSLocalizedString(BFAlertUI.appTitle, comment: ""),
                message: message,
                preferredStyle: .alert
            )
            alertView.addAction(UIAlertAction(title: BFAlertUI.ok, style: .default))
            self.present(alertView, animated: true)
        }
        if Thread.isMainThread {
            presentAlert()
        } else {
            DispatchQueue.main.async(execute: presentAlert)
        }
    }

    func isValidPassword(_ password: String) -> Bool {
        BFValidationPredicates.password.evaluate(with: password)
    }

    func isValidEmail(_ emailString: String) -> Bool {
        BFValidationPredicates.email.evaluate(with: emailString)
    }
}

