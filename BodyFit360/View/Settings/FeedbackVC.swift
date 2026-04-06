//
//  FeedbackVC.swift
//  BodyFit360
//
//  Created by Ramanjeet Singh
//
//

import UIKit

class FeedbackVC: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var txtVwDescription: UITextView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblForm: UILabel!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var btnChooseType: UIButton!

    // MARK: - Properties

    private var placeholderText: String { BFFeedbackStrings.placeholder }

    var isdropDownOpen: Bool = true {
        didSet {
            UIView.animate(withDuration: 0.25) {
                if self.isdropDownOpen {
                    self.btnChooseType.imageView?.transform = CGAffineTransform.identity
                } else {
                    self.btnChooseType.imageView?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
                }
            }
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTypeMenu()
        configureDescriptionField()
    }

    // MARK: - Setup

    private func configureTypeMenu() {
        btnChooseType.setTitle(BFFeedbackStrings.chooseHelpPrompt, for: .normal)
        btnChooseType.layer.borderColor = UIColor.black.cgColor
        btnChooseType.layer.borderWidth = 1
        btnChooseType.setTitleColor(.black, for: .normal)
        btnChooseType.layer.cornerRadius = 8

        let menuItems = [
            UIAction(title: BFFeedbackStrings.bugReport, handler: { _ in
                self.isdropDownOpen.toggle()
                self.btnChooseType.setTitle(BFFeedbackStrings.bugReport, for: .normal)
            }),
            UIAction(title: BFFeedbackStrings.featureRequest, handler: { _ in
                self.isdropDownOpen.toggle()
                self.btnChooseType.setTitle(BFFeedbackStrings.featureRequest, for: .normal)
            }),
            UIAction(title: BFFeedbackStrings.designUX, handler: { _ in
                self.isdropDownOpen.toggle()
                self.btnChooseType.setTitle(BFFeedbackStrings.designUX, for: .normal)
            }),
            UIAction(title: BFFeedbackStrings.other, handler: { _ in
                self.isdropDownOpen.toggle()
                self.btnChooseType.setTitle(BFFeedbackStrings.other, for: .normal)
            })
        ]

        btnChooseType.menu = UIMenu(title: BFFeedbackStrings.menuTitle, children: menuItems)
        btnChooseType.showsMenuAsPrimaryAction = true
        btnChooseType.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(btnChooseTypeAction)))
    }

    private func configureDescriptionField() {
        txtVwDescription.delegate = self
        txtVwDescription.text = placeholderText
        txtVwDescription.textColor = .lightGray
        txtVwDescription.layer.borderColor = UIColor.black.cgColor
        txtVwDescription.layer.borderWidth = 1
        txtVwDescription.layer.cornerRadius = 8
    }

    // MARK: - Actions

    @IBAction func btnBackAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func btnSubmit(_ sender: Any) {}

    @objc private func btnChooseTypeAction() {
        isdropDownOpen.toggle()
    }
}

// MARK: - UITextViewDelegate

extension FeedbackVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholderText {
            textView.text = ""
            textView.textColor = .black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = .lightGray
        }
    }
}
