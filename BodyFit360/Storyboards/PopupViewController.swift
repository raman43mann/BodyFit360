//
//  PopupViewController.swift
//  BodyFit360
//
//  Created by Ramanjeet Singh
//
//

import UIKit

class PopupViewController: UIViewController {

    // MARK: - Types

    enum PopupType {
        case Logout
        case DeleteAccount
    }

    // MARK: - Outlets

    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnAccept: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var viewMessageContainer: UIView!

    // MARK: - Properties

    var setPopupType: PopupType?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        viewMessageContainer.addShadow()
        btnAccept.layer.cornerRadius = btnAccept.frame.height / 2
        btnAccept.layer.masksToBounds = true
        btnAccept.layer.borderWidth = 1
        let redishColor = UIColor(hex: "#C90B26")
        btnAccept.layer.borderColor = redishColor.cgColor
        btnAccept.setTitleColor(redishColor, for: .normal)

        switch setPopupType {
        case .Logout:
            lblMessage.text = BFPopupStrings.logoutMessage
            btnAccept.setTitle(BFPopupStrings.logoutTitle, for: .normal)
        case .DeleteAccount:
            lblMessage.text = BFPopupStrings.deleteAccountMessage
            btnAccept.setTitle(BFPopupStrings.deleteAccountTitle, for: .normal)
        case nil:
            fatalError(BFPopupStrings.fatalErrorMissingPopupType)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let path = UIBezierPath(
            roundedRect: viewMessageContainer.bounds,
            byRoundingCorners: [.topLeft, .topRight, .bottomLeft, .bottomRight],
            cornerRadii: CGSize(width: 25, height: 25)
        )
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        viewMessageContainer.layer.mask = maskLayer

        viewMessageContainer.layer.shadowColor = UIColor.black.cgColor
        viewMessageContainer.layer.shadowOffset = CGSize(width: 0, height: 4)
        viewMessageContainer.layer.shadowOpacity = 0.25
        viewMessageContainer.layer.shadowRadius = 8
        viewMessageContainer.layer.shadowPath = path.cgPath
    }

    // MARK: - Actions

    @IBAction func btnAction(_ sender: UIButton) {
        if sender == btnAccept {
            dismiss(animated: true) {
                self.changeRoot()
            }
        } else if sender == btnCancel {
            dismiss(animated: true)
        }
    }

    // MARK: - Root transition

    private func changeRoot() {
        let storyboard = UIStoryboard(name: BFStoryboardNames.main, bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: BFStoryboardIDs.signUpVC) as? SignUpVC else { return }
        let nav = UINavigationController(rootViewController: vc)
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
              let window = sceneDelegate.window else { return }
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}

// MARK: - UIColor + hex

extension UIColor {
    convenience init(hex: String) {
        var hexFormatted = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted.remove(at: hexFormatted.startIndex)
        }

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
