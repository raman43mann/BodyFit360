//
//  ResetPasswordVC.swift
//  BodyFit360
//
//  Created by Ramanjeet Singh on 17/10/24.
//

import UIKit

class ResetPasswordVC: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var emailTextField: UITextField!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @IBAction func btnContinueAction(_ sender: UIButton) {
        guard let raw = emailTextField.text else {
            alert(message: BFAlertMessages.pleaseEnterEmail)
            return
        }
        let trimmed = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            alert(message: BFAlertMessages.pleaseEnterEmail)
            return
        }
        guard isValidEmail(trimmed.lowercased()) else {
            alert(message: BFAlertMessages.pleaseEnterValidEmail)
            return
        }

        guard let vc = storyboard?.instantiateViewController(withIdentifier: BFStoryboardIDs.emailConfirmationVC) as? EmailConfirmationVC else { return }
        vc.email = trimmed
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
