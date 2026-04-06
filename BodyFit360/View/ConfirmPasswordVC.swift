//
//  ConfirmPasswordVC.swift
//  BodyFit360
//
//  Created by Ramanjeet Singh on 17/10/24.
//

import UIKit

class ConfirmPasswordVC: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var passwordTextField: UITextField!

    // MARK: - Properties

    var emailTxt: String?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @IBAction func btnContinueAction(_ sender: UIButton) {
        guard !(emailTxt?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "").isEmpty else {
            alert(message: BFAlertMessages.pleaseEnterEmail)
            return
        }

        guard let password = passwordTextField.text, !password.isEmpty else {
            alert(message: BFAlertMessages.pleaseEnterPassword)
            return
        }

        guard isValidPassword(password) else {
            alert(message: BFAlertMessages.passwordComplexity)
            return
        }

        guard let vc = storyboard?.instantiateViewController(withIdentifier: BFStoryboardIDs.chooseBodyMapVC) as? ChooseBodyMapVC else { return }
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
