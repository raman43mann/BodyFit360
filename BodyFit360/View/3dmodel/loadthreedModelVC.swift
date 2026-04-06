//
//  loadthreedModelVC.swift
//  BodyFit360
//
//  Created by Ramanjeet Singh
//  Created by Kaushal on 23/10/24.
//

import UIKit
import SceneKit

class loadthreedModelVC: UIViewController {

    // MARK: - Properties

    var sceneView: SCNView!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView = SCNView(frame: view.frame)
        view.addSubview(sceneView)

        if let scene = SCNScene(named: BFSceneResourceNames.idleMaleMaterials) {
            sceneView.scene = scene
        }

        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 10)
        sceneView.scene?.rootNode.addChildNode(cameraNode)

        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        sceneView.scene?.rootNode.addChildNode(lightNode)

        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = UIColor.darkGray
        sceneView.scene?.rootNode.addChildNode(ambientLightNode)

        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.backgroundColor = .clear
        sceneView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
    }

    // MARK: - Gestures

    @objc func handleTap(_ gestureRecognize: UIGestureRecognizer) {
        let touchLocation = gestureRecognize.location(in: sceneView)
        let hitResults = sceneView.hitTest(touchLocation, options: nil)
        if let hit = hitResults.first {
            let tappedNode = hit.node
            print("Bone name", hit.boneNode?.name)
            highlightMuscle(node: tappedNode)
        }
    }

    // MARK: - Scene

    private func highlightMuscle(node: SCNNode) {
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.red
    }
}
