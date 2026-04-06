//
//  SettingsVC.swift
//  BodyFit360
//
//  Created by Ramanjeet Singh
//
//

import UIKit

class SettingsVC: UIViewController {

    // MARK: - Outlets (header & segments)

    @IBOutlet weak var lblSetttings: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet var viewSegmentcontainer: UIView!
    @IBOutlet weak var btnPersonal: UIButton!
    @IBOutlet weak var btnGeneral: UIButton!
    @IBOutlet weak var imgPersonal: UIImageView!
    @IBOutlet weak var imgGeneral: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!

    // MARK: - Outlets (personal)

    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var lblPreferredBodyMap: UILabel!
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var imageMale: UIImageView!
    @IBOutlet weak var btnFemale: UIButton!
    @IBOutlet weak var imageFemale: UIImageView!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var lblSuccessMessage: UILabel!
    @IBOutlet weak var btnEmailEdit: UIButton!
    @IBOutlet weak var btnPasswordEdit: UIButton!

    // MARK: - Outlets (general)

    @IBOutlet weak var tblView: UITableView!

    // MARK: - Properties

    var arrayGenerals: [String] = [
        BFSettingsStrings.aboutUs,
        BFSettingsStrings.privacyPolicy,
        BFSettingsStrings.feedback,
        BFSettingsStrings.logOut,
        BFSettingsStrings.deleteAccount
    ]

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
        viewSegmentcontainer.layer.cornerRadius = viewSegmentcontainer.frame.size.height / 2
        viewSegmentcontainer.layer.masksToBounds = true
        selectedButton(btnPersonal)
    }

    // MARK: - Actions

    @IBAction func btnBackAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func btnPersonalGeneralAction(_ sender: UIButton) {
        selectedButton(sender)
    }

    @IBAction func btnMaleFemaleAction(_ sender: UIButton) {
        if sender == btnMale {
            imageMale.image = UIImage(named: BFImageNames.selectedBackIc)
            imageFemale.image = UIImage(named: BFImageNames.unselectedBackIc)
            btnMale.setTitleColor(.white, for: .normal)
            btnFemale.setTitleColor(.black, for: .normal)
        } else {
            imageMale.image = UIImage(named: BFImageNames.unselectedBackIc)
            imageFemale.image = UIImage(named: BFImageNames.selectedBackIc)
            btnMale.setTitleColor(.black, for: .normal)
            btnFemale.setTitleColor(.white, for: .normal)
        }
    }

    @IBAction func btnEmailPasswordEdit(_ sender: UIButton) {
        setEmailPasswordEdit(sender)
    }

    @IBAction func btnDoneAction(_ sender: UIButton) {}

    // MARK: - Personal / general UI

    private func setEmailPasswordEdit(_ sender: UIButton) {
        if sender == btnEmailEdit {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: BFStoryboardIDs.emailEditingVC) as? EmailEditingVC else { return }
            navigationController?.pushViewController(vc, animated: true)
        } else if sender == btnPasswordEdit {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: BFStoryboardIDs.passwordChangeVC) as? PasswordChangeVC else { return }
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    private func selectedButton(_ sender: UIButton) {
        if sender == btnPersonal {
            imgPersonal.image = UIImage(named: BFImageNames.selectedBackIc)
            imgGeneral.image = nil
            btnPersonal.setTitleColor(.white, for: .normal)
            btnGeneral.setTitleColor(.black, for: .normal)
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
        } else if sender == btnGeneral {
            imgGeneral.image = UIImage(named: BFImageNames.selectedBackIc)
            imgPersonal.image = nil
            btnGeneral.setTitleColor(.white, for: .normal)
            btnPersonal.setTitleColor(.black, for: .normal)
            scrollView.setContentOffset(CGPoint(x: scrollView.frame.width, y: 0), animated: false)
        }
    }

    // MARK: - Popups & content

    private func authPopupView(isLogout: Bool) {
        let storyboard = UIStoryboard(name: BFStoryboardNames.popup, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: BFStoryboardIDs.popupViewController) as? PopupViewController else { return }
        viewController.setPopupType = isLogout ? .Logout : .DeleteAccount
        viewController.modalPresentationStyle = .overFullScreen
        present(viewController, animated: false)
    }

    private func privacyOrAboutUs(isPrivacy: Bool) {
        let storyboard = UIStoryboard(name: BFStoryboardNames.main, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: BFStoryboardIDs.privacyVC) as? PrivacyVC else { return }
        viewController.setTitle = isPrivacy ? BFSettingsStrings.privacyPolicy : BFSettingsStrings.aboutUs
        viewController.isPrivacy = isPrivacy
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: BFReuseIdentifiers.settingTableCell, for: indexPath) as? SettingTableCell
        let item = arrayGenerals[indexPath.row]
        cell?.lblTitle.text = item
        if item == BFSettingsStrings.deleteAccount {
            let redishColor = UIColor(hex: "#C90B26")
            cell?.lblTitle.textColor = redishColor
            cell?.seprator.isHidden = true
        } else {
            cell?.lblTitle.textColor = .black
            cell?.seprator.isHidden = false
        }
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayGenerals.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch arrayGenerals[indexPath.row] {
        case BFSettingsStrings.aboutUs:
            privacyOrAboutUs(isPrivacy: false)
        case BFSettingsStrings.privacyPolicy:
            privacyOrAboutUs(isPrivacy: true)
        case BFSettingsStrings.feedback:
            guard let vc = storyboard?.instantiateViewController(withIdentifier: BFStoryboardIDs.feedbackVC) as? FeedbackVC else { return }
            navigationController?.pushViewController(vc, animated: true)
        case BFSettingsStrings.logOut:
            authPopupView(isLogout: true)
        case BFSettingsStrings.deleteAccount:
            authPopupView(isLogout: false)
        default:
            break
        }
    }
}

// MARK: - SettingTableCell

class SettingTableCell: UITableViewCell {
    @IBOutlet weak var seprator: UIView!
    @IBOutlet weak var lblTitle: UILabel!
}
