//
//  SignUpVC.swift
//  BodyFit360
//
//  Created by Ramanjeet Singh on 16/10/24.
//

import UIKit

class SignUpVC: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var emailBackView: CustomView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var appleBtn: UIButton!
    @IBOutlet weak var authView: UIStackView!
    @IBOutlet weak var googleBtn: UIButton!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @IBAction func googleActionHandler(_ sender: UIButton) {
        navigateToChooseBodyMap()
    }

    @IBAction func appleActionHandler(_ sender: UIButton) {
        navigateToChooseBodyMap()
    }

    @IBAction func continueActionHandler(_ sender: UIButton) {
        guard let raw = emailTextField.text else {
            alert(message: BFAlertMessages.pleaseEnterEmail)
            return
        }
        let trimmed = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            alert(message: BFAlertMessages.pleaseEnterEmail)
            return
        }
        let email = trimmed.lowercased()
        guard isValidEmail(email) else {
            alert(message: BFAlertMessages.pleaseEnterValidEmail)
            return
        }

        moveToContinueVC(with: email)
    }

    @IBAction func alreadyAccountActionHandler(_ sender: UIButton) {
        moveToLoginVC()
    }

    // MARK: - Navigation

    private func navigateToChooseBodyMap() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: BFStoryboardIDs.chooseBodyMapVC) as? ChooseBodyMapVC else { return }
        navigationController?.pushViewController(vc, animated: true)
    }

    private func moveToLoginVC() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: BFStoryboardIDs.loginVC) as? LoginVC else { return }
        navigationController?.pushViewController(vc, animated: true)
    }

    private func moveToContinueVC(with email: String) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: BFStoryboardIDs.continueWithEmailVC) as? ContinueWithEmailVC else { return }
        vc.emailTxt = email
        navigationController?.pushViewController(vc, animated: true)
    }
}
