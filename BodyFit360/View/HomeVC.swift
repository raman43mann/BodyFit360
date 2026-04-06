//
//  HomeVC.swift
//  BodyFit360
//
//  Created by Ramanjeet Singh on 17/10/24.
//

import UIKit
import SceneKit

// MARK: - HomeVC

class HomeVC: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var viewSearchContainer: UIView!
    @IBOutlet weak var SettingBtn: UIButton!
    @IBOutlet weak var animateScnView: SCNView!
    @IBOutlet weak var bottomView: CustomShapeView!
    @IBOutlet weak var searchBar: UISearchBar!

    // MARK: - Properties

    var popupView = PopupViewTypes(size: .chooseMuscle)
    private var bodySceneController: BFBodyMapSceneController?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomView(popUpType: .chooseMuscle, state: .closed)
        setupBodyScene()
    }

    // MARK: - Setup

    func setupBottomView(popUpType: PopupSize, state: PopupState) {
        popupView = PopupViewTypes(size: popUpType)
        view.addSubview(popupView)
        popupView.togglePopup()
    }

    private func setupBodyScene() {
        let controller = BFBodyMapSceneController()
        controller.delegate = self
        controller.attach(to: animateScnView)
        bodySceneController = controller
    }

    // MARK: - Actions

    @IBAction func btnSettingHandler(_ sender: Any) {
        guard let settingVC = storyboard?.instantiateViewController(identifier: BFStoryboardIDs.settingsVC) as? SettingsVC else { return }
        navigationController?.pushViewController(settingVC, animated: true)
    }

    @IBAction func btnCloseSelectionHandler(_ sender: Any) {}
}

// MARK: - BFBodyMapSceneControllerDelegate

extension HomeVC: BFBodyMapSceneControllerDelegate {
    func bodyMapSceneController(_ controller: BFBodyMapSceneController, didSelectMuscleNamed name: String) {
        popupView.muscle = name
        popupView.seletedMethod()
    }

    func bodyMapSceneControllerDidTapMiss(_ controller: BFBodyMapSceneController) {
        popupView.seletedMethod()
    }
}
