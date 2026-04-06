//
//  LoginVC.swift
//  BodyFit360
//
//  Created by Ramanjeet Singh on 17/10/24.
//

import UIKit

final class LoginVC: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    // MARK: - Properties

    var email = ""

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.text = email
    }

    // MARK: - Actions

    @IBAction private func btnForgotPassword(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: BFStoryboardIDs.resetPasswordVC) as? ResetPasswordVC else { return }
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction private func btnContinueAction(_ sender: UIButton) {
        let rawEmail = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        guard !rawEmail.isEmpty else {
            alert(message: BFAlertMessages.pleaseEnterEmail)
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            alert(message: BFAlertMessages.pleaseEnterPassword)
            return
        }
        let emailLowercased = rawEmail.lowercased()
        guard isValidEmail(emailLowercased) else {
            alert(message: BFAlertMessages.pleaseEnterValidEmail)
            return
        }
        guard isValidPassword(password) else {
            alert(message: BFAlertMessages.passwordComplexity)
            return
        }
        pushHomeVC()
    }

    @IBAction private func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Navigation

    private func pushHomeVC() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: BFStoryboardIDs.homeVC) as? HomeVC else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}
