//
//  ContinueWithEmailVC.swift
//  BodyFit360
//
//  Created by Ramanjeet Singh on 17/10/24.
//

import UIKit

class ContinueWithEmailVC: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var emailTextField: UITextField!

    // MARK: - Properties

    var emailTxt: String?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        if let email = emailTxt {
            emailTextField.text = email
        }
    }

    // MARK: - Actions

    @IBAction func btnContinueAction(_ sender: UIButton) {
        guard let email = emailTxt?.trimmingCharacters(in: .whitespacesAndNewlines), !email.isEmpty else {
            alert(message: BFAlertMessages.pleaseEnterEmail)
            return
        }

        guard isValidEmail(email.lowercased()) else {
            alert(message: BFAlertMessages.pleaseEnterValidEmail)
            return
        }

        guard let vc = storyboard?.instantiateViewController(withIdentifier: BFStoryboardIDs.confirmPasswordVC) as? ConfirmPasswordVC else { return }
        vc.emailTxt = email
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
