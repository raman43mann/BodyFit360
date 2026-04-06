//
//  BFBodyMapSceneController.swift
//  BodyFit360
//

import UIKit
import SceneKit

// MARK: - Delegate

protocol BFBodyMapSceneControllerDelegate: AnyObject {
    func bodyMapSceneController(_ controller: BFBodyMapSceneController, didSelectMuscleNamed name: String)
    func bodyMapSceneControllerDidTapMiss(_ controller: BFBodyMapSceneController)
}

// MARK: - Controller

/// Owns the 3D body scene: loading, camera, pan rotation, tap-to-select muscle materials.
final class BFBodyMapSceneController: NSObject {

    weak var delegate: BFBodyMapSceneControllerDelegate?
    private weak var sceneView: SCNView?

    private let cameraNode = SCNNode()
    private var selectedMaterial: SCNMaterial?
    private var selectedColor: UIColor?

    /// Call once when the `SCNView` is ready (e.g. from `viewDidLoad`).
    func attach(to sceneView: SCNView) {
        guard self.sceneView == nil else { return }
        self.sceneView = sceneView

        loadScene(into: sceneView)
        configureCamera(in: sceneView)
        configureView(sceneView)
        addGestures(to: sceneView)
    }

    // MARK: - Scene

    private func loadScene(into sceneView: SCNView) {
        if let scene = SCNScene(named: BFSceneResourceNames.idleMaleMaterials) {
            sceneView.scene = scene
        }
    }

    private func configureCamera(in sceneView: SCNView) {
        guard let scene = sceneView.scene else { return }
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 4)
        scene.rootNode.addChildNode(cameraNode)
    }

    private func configureView(_ sceneView: SCNView) {
        sceneView.allowsCameraControl = false
        sceneView.defaultCameraController.minimumVerticalAngle = 90
        sceneView.defaultCameraController.interactionMode = .orbitTurntable
        sceneView.autoenablesDefaultLighting = true
        sceneView.backgroundColor = .clear
    }

    // MARK: - Gestures

    private func addGestures(to sceneView: SCNView) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        sceneView.addGestureRecognizer(pan)

        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        sceneView.addGestureRecognizer(tap)
    }

    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        guard let sceneView else { return }
        let translation = gesture.translation(in: sceneView)
        let rotationY = Float(translation.x) * (Float.pi / 180)
        sceneView.scene?.rootNode.eulerAngles.y += rotationY
        gesture.setTranslation(.zero, in: sceneView)
    }

    @objc private func handleTap(_ gesture: UIGestureRecognizer) {
        guard let sceneView else { return }
        let touchLocation = gesture.location(in: sceneView)
        let hitResults = sceneView.hitTest(touchLocation, options: nil)
        guard let result = hitResults.first,
              let geometry = result.node.geometry,
              result.geometryIndex < geometry.materials.count else {
            delegate?.bodyMapSceneControllerDidTapMiss(self)
            return
        }

        let material = geometry.materials[result.geometryIndex]
        print(material.name ?? "")

        if let previous = selectedMaterial {
            previous.diffuse.contents = selectedColor
        }
        selectedMaterial = material
        if let color = material.diffuse.contents as? UIColor {
            selectedColor = color
        }
        material.diffuse.contents = UIColor(named: BFColorAssetNames.muscleSelect)

        delegate?.bodyMapSceneController(self, didSelectMuscleNamed: material.name ?? "")
    }
}
