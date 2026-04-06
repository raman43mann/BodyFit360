//
//  EmailEditingVC.swift
//  BodyFit360
//
//  Created by Ramanjeet Singh
//
//

import UIKit

class EmailEditingVC: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnVerify: UIButton!
    @IBOutlet weak var tfEmail: UITextField!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Setup

    private func setupUI() {}

    // MARK: - Actions

    @IBAction func btnBackAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func btnVerifyAction(_ sender: Any) {
        guard let rawEmail = tfEmail.text, !rawEmail.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            alert(message: BFAlertMessages.pleaseEnterEmail)
            return
        }

        let email = rawEmail.lowercased()
        guard isValidEmail(email) else {
            alert(message: BFAlertMessages.pleaseEnterValidEmail)
            return
        }

        performEmailVerification(email: email)
    }

    // MARK: - Email verification (next)

    private func performEmailVerification(email: String) {
        // Next: API call, loading state, then navigate (e.g. OTP / confirmation) using `email`
    }
}
