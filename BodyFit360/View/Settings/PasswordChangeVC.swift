//
//  PasswordChangeVC.swift
//  BodyFit360
//
//  Created by Ramanjeet Singh
//
//

import UIKit

class PasswordChangeVC: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblTitleNewPassword: UILabel!
    @IBOutlet weak var lblTitleReEnterNewPassword: UILabel!
    @IBOutlet weak var tfNewPassword: UITextField!
    @IBOutlet weak var tfReEnterPassword: UITextField!
    @IBOutlet weak var btnDone: UIButton!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @IBAction func btnBackAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func btnDoneAction(_ sender: Any) {}
}
