//
//  ChooseBodyMapVC.swift
//  BodyFit360
//
//  Created by Ramanjeet Singh on 17/10/24.
//

import UIKit

class ChooseBodyMapVC: UIViewController {

    // MARK: - Types

    enum GenderType: String {
        case male
        case female
    }

    // MARK: - Outlets

    @IBOutlet weak var maleBackImgview: UIImageView!
    @IBOutlet weak var femaleBackImgview: UIImageView!
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnFemale: UIButton!

    // MARK: - Properties

    var isMaleselected = true

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        isMaleselected = true
        setGenderType(isMale: isMaleselected)
    }

    // MARK: - Actions

    @IBAction func btnMaleAction(_ sender: UIButton) {
        setGenderType(isMale: true)
    }

    @IBAction func btnFemaleAction(_ sender: UIButton) {
        setGenderType(isMale: false)
    }

    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func btnContinueAction(_ sender: UIButton) {
        moveToHome()
    }

    // MARK: - Gender UI

    private func setGenderType(isMale: Bool) {
        isMaleselected = isMale
        if isMale {
            maleBackImgview.image = UIImage(named: BFImageNames.selectedBackIc)
            femaleBackImgview.image = UIImage(named: BFImageNames.unselectedBackIc)
            btnMale.setTitleColor(.white, for: .normal)
            btnFemale.setTitleColor(.black, for: .normal)
        } else {
            maleBackImgview.image = UIImage(named: BFImageNames.unselectedBackIc)
            femaleBackImgview.image = UIImage(named: BFImageNames.selectedBackIc)
            btnMale.setTitleColor(.black, for: .normal)
            btnFemale.setTitleColor(.white, for: .normal)
        }
    }

    // MARK: - Navigation

    private func moveToHome() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: BFStoryboardIDs.homeVC) as? HomeVC else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}
