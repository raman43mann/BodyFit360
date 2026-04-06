//
//  OtpVerificationVC.swift
//  BodyFit360
//
//  Created by Ramanjeet Singh on 17/10/24.
//

import UIKit

class OtpVerificationVC: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var otpVerifcationTextField: AEOTPTextField!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupOtpView()
    }

    // MARK: - Setup

    private func setupOtpView() {
        otpVerifcationTextField.otpDelegate = self
        otpVerifcationTextField.configure(with: 8)
        otpVerifcationTextField.becomeFirstResponder()
    }

    // MARK: - Actions

    @IBAction func btnContinueAction(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: BFStoryboardIDs.loginVC) as? LoginVC else { return }
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - AEOTPTextFieldDelegate

extension OtpVerificationVC: AEOTPTextFieldDelegate {
    func didUserFinishEnter(the code: String) {
        print(code)
    }
}
