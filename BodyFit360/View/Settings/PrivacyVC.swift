//
//  PrivacyVC.swift
//  BodyFit360
//
//  Created by Ramanjeet Singh
//
//

import UIKit

class PrivacyVC: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var lblSettings: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtViewDescription: UITextView!

    // MARK: - Properties

    var setTitle: String?
    var isPrivacy: Bool?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = setTitle

        if isPrivacy == true {
            txtViewDescription.attributedText = addBoldText(
                fullString: BFPrivacyStrings.privacyFullText as NSString,
                boldPartOfString: BFPrivacyStrings.privacyBoldPrefix as NSString,
                font: .systemFont(ofSize: 16, weight: .regular),
                boldFont: .systemFont(ofSize: 18, weight: .semibold)
            )
        } else {
            txtViewDescription.attributedText = addBoldText(
                fullString: BFPrivacyStrings.aboutUsFullText as NSString,
                boldPartOfString: BFPrivacyStrings.aboutUsBoldPrefix as NSString,
                font: .systemFont(ofSize: 16, weight: .regular),
                boldFont: .systemFont(ofSize: 18, weight: .semibold)
            )
        }
    }

    // MARK: - Actions

    @IBAction func btnBackAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Attributed text

    private func addBoldText(fullString: NSString, boldPartOfString: NSString, font: UIFont!, boldFont: UIFont!) -> NSAttributedString {
        let nonBoldFontAttribute = [NSAttributedString.Key.font: font!]
        let boldFontAttribute = [NSAttributedString.Key.font: boldFont!]
        let boldString = NSMutableAttributedString(string: fullString as String, attributes: nonBoldFontAttribute)
        boldString.addAttributes(boldFontAttribute, range: fullString.range(of: boldPartOfString as String))
        return boldString
    }
}
