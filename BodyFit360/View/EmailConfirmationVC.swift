//
//  EmailConfirmationVC.swift
//  BodyFit360
//
//  Created by Ramanjeet Singh on 17/10/24.
//

import UIKit

class EmailConfirmationVC: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var lblDescription: UILabel!

    // MARK: - Properties

    var email = ""

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let attrString = NSMutableAttributedString(
            string: String(format: BFEmailConfirmationStrings.emailVisitMessageFormat, arguments: [email])
        )
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .semibold)
        ]
        attrString.addAttributesTo(substring: email, attributes: attributes)
        attrString.append(NSAttributedString(string: "\n\n" + BFEmailConfirmationStrings.emailVisitMessageWarning))
        lblDescription.attributedText = attrString
    }

    // MARK: - Actions

    @IBAction func btnContinueAction(_ sender: UIButton) {
        guard let nav = navigationController else { return }
        for controller in nav.viewControllers where controller is LoginVC {
            nav.popToViewController(controller, animated: true)
            break
        }
    }

    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
