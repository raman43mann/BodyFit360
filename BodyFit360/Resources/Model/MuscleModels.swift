//
//  Untitled.swift
//  BodyFit360
//
//  Created by Ramanjeet Singh 
//
//

import Foundation
//
//// Define the model categories as an enumeration
//enum ModelCategory: String {
//    case cheeksAndTemple = "CheeksAndTemple"
//    case lowerTrunk = "LowerTrunk"
//    case lats1 = "Lats1"
//    case adductors = "Adductors"
//    case quads = "Quads"
//    case glutes = "Glutes"
//    case hamstrings = "Hamstrings"
//    case upperTrunk = "UpperTrunk"
//    case traps = "Traps"
//    case arms = "Arms"
//    case neck = "Neck"
//    case feet = "Feet"
//    case shin = "Shin"
//    case calves = "Calves"
//    case knees = "Knees"
//}
//
//
//
//// Function to determine the category of a muscle part
//func category(for part: String) -> ModelCategory? {
//    switch part {
//    case "Eye_Mesh_Low_PolyFBXASC058LeftShoulder",
//                "Eye_Mesh_Low_PolyFBXASC058LeftArm",
//                "Eye_Mesh_Low_PolyFBXASC058LeftForeArm",
//                "Eye_Mesh_Low_PolyFBXASC058LeftHand",
//                "Eye_Mesh_Low_PolyFBXASC058LeftHandThumb1",
//                "Eye_Mesh_Low_PolyFBXASC058LeftHandThumb2",
//                "Eye_Mesh_Low_PolyFBXASC058LeftHandThumb3",
//                "Eye_Mesh_Low_PolyFBXASC058LeftHandThumb4",
//                "Eye_Mesh_Low_PolyFBXASC058LeftHandIndex1",
//                "Eye_Mesh_Low_PolyFBXASC058LeftHandIndex2",
//                "Eye_Mesh_Low_PolyFBXASC058LeftHandIndex3",
//                "Eye_Mesh_Low_PolyFBXASC058LeftHandIndex4",
//                "Eye_Mesh_Low_PolyFBXASC058LeftHandMiddle1",
//                "Eye_Mesh_Low_PolyFBXASC058LeftHandMiddle2",
//                "Eye_Mesh_Low_PolyFBXASC058LeftHandMiddle3",
//                "Eye_Mesh_Low_PolyFBXASC058LeftHandMiddle4",
//                "Eye_Mesh_Low_PolyFBXASC058LeftHandRing1",
//                "Eye_Mesh_Low_PolyFBXASC058LeftHandRing2",
//                "Eye_Mesh_Low_PolyFBXASC058LeftHandRing3",
//                "Eye_Mesh_Low_PolyFBXASC058LeftHandRing4",
//                "Eye_Mesh_Low_PolyFBXASC058LeftHandPinky1",
//                "Eye_Mesh_Low_PolyFBXASC058LeftHandPinky2",
//                "Eye_Mesh_Low_PolyFBXASC058LeftHandPinky3",
//                "Eye_Mesh_Low_PolyFBXASC058LeftHandPinky4":
//        return .arms
//
//        case    "Eye_Mesh_Low_PolyFBXASC058RightShoulder",
//                "Eye_Mesh_Low_PolyFBXASC058RightArm",
//                "Eye_Mesh_Low_PolyFBXASC058RightForeArm",
//                "Eye_Mesh_Low_PolyFBXASC058RightHand",
//                "Eye_Mesh_Low_PolyFBXASC058RightHandThumb1",
//                "Eye_Mesh_Low_PolyFBXASC058RightHandThumb2",
//                "Eye_Mesh_Low_PolyFBXASC058RightHandThumb3",
//                "Eye_Mesh_Low_PolyFBXASC058RightHandThumb4",
//                "Eye_Mesh_Low_PolyFBXASC058RightHandIndex1",
//                "Eye_Mesh_Low_PolyFBXASC058RightHandIndex2",
//                "Eye_Mesh_Low_PolyFBXASC058RightHandIndex3",
//                "Eye_Mesh_Low_PolyFBXASC058RightHandIndex4",
//                "Eye_Mesh_Low_PolyFBXASC058RightHandMiddle1",
//                "Eye_Mesh_Low_PolyFBXASC058RightHandMiddle2",
//                "Eye_Mesh_Low_PolyFBXASC058RightHandMiddle3",
//                "Eye_Mesh_Low_PolyFBXASC058RightHandMiddle4",
//                "Eye_Mesh_Low_PolyFBXASC058RightHandRing1",
//                "Eye_Mesh_Low_PolyFBXASC058RightHandRing2",
//                "Eye_Mesh_Low_PolyFBXASC058RightHandRing3",
//                "Eye_Mesh_Low_PolyFBXASC058RightHandRing4",
//                "Eye_Mesh_Low_PolyFBXASC058RightHandPinky1",
//                "Eye_Mesh_Low_PolyFBXASC058RightHandPinky2",
//                "Eye_Mesh_Low_PolyFBXASC058RightHandPinky3",
//        "Eye_Mesh_Low_PolyFBXASC058RightHandPinky4":
//        return .arms
//
//        
//    case "Eye_Mesh_Low_PolyFBXASC058Hips",
//         "Eye_Mesh_Low_PolyFBXASC058Spine",
//         "Eye_Mesh_Low_PolyFBXASC058Spine1",
//        "Eye_Mesh_Low_PolyFBXASC058Spine2":
//        return .upperTrunk
//        
//        case
//         "Eye_Mesh_Low_PolyFBXASC058Neck",
//         "Eye_Mesh_Low_PolyFBXASC058Head",
//        "Eye_Mesh_Low_PolyFBXASC058HeadTop_End":
//        return .upperTrunk
//
//    case "Eye_Mesh_Low_PolyFBXASC058LeftUpLeg",
//         "Eye_Mesh_Low_PolyFBXASC058LeftLeg",
//         "Eye_Mesh_Low_PolyFBXASC058LeftFoot",
//         "Eye_Mesh_Low_PolyFBXASC058LeftToeBase",
//        "Eye_Mesh_Low_PolyFBXASC058LeftToe_End":
//        return .quads
//
//    case "Eye_Mesh_Low_PolyFBXASC058RightUpLeg",
//         "Eye_Mesh_Low_PolyFBXASC058RightLeg",
//         "Eye_Mesh_Low_PolyFBXASC058RightFoot",
//         "Eye_Mesh_Low_PolyFBXASC058RightToeBase",
//        "Eye_Mesh_Low_PolyFBXASC058RightToe_End":
//        return .feet
//
//    // Add more cases as needed for other categories
//    default:
//        return nil // Handle the default case
//    }
//}


import SceneKit

enum NodeMaterialCategory: String {
    case cheeksAndTemple = "CheeksAndTemple"
    case lowerTrunk = "LowerTrunk"
    case lats1 = "Lats1"
    case adductors = "Adductors"
    case quads = "Quads"
    case glutes = "Glutes"
    case hamstrings = "Hamstrings"
    case upperTrunk = "UpperTrunk"
    case traps = "Traps"
    case arms = "Arms"
    case neck = "Neck"
    case feet = "Feet"
    case shin = "Shin"
    case calves = "Calves"
    case knees = "Knees"
}

func getNodeToMaterial(_ node: SCNNode) -> NodeMaterialCategory? {
    guard let name = node.name else { return nil }
    switch name {
    case let name where name.contains("Head") || name.contains("Cheek") :
        return .cheeksAndTemple
    case let name where name.contains("Spine") || name.contains("LowerTrunk"):
        return .lowerTrunk
    case let name where name.contains("Lat"):
        return .lats1
    case let name where name.contains("Adductor"):
        return .adductors
    case let name where name.contains("Quad"):
        return .quads
    case let name where name.contains("Glute"):
        return .glutes
    case let name where name.contains("Hamstring"):
        return .hamstrings
    case let name where name.contains("UpperTrunk"):
        return .upperTrunk
    case let name where name.contains("Trap"):
        return .traps
    case let name where name.contains("Arm"):
        return .arms
    case let name where name.contains("Neck"):
        return .neck
    case let name where name.contains("Foot"):
        return .feet
    case let name where name.contains("Shin"):
        return .shin
    case let name where name.contains("Calf"):
        return .calves
    case let name where name.contains("Knee"):
        return .knees
    default:
        return nil
    }
}

//func sortNodesByCategory(_ node: SCNNode, result: inout [NodeCategory: [SCNNode]]) {
//    if let category = categorizeNode(node) {
//        result[category, default: []].append(node)
//    }
//    for child in node.childNodes {
//        sortNodesByCategory(child, result: &result)
//    }
//}
//
//// Load your 3D model into an SCNScene
//guard let scene = SCNScene(named: "Your3DModel.scn") else {
//    print("Failed to load scene")
//    return
//}
//
//// Dictionary to store nodes by category
//var categorizedNodes: [NodeCategory: [SCNNode]] = [:]
//
//// Start categorizing from the root node
//sortNodesByCategory(scene.rootNode, result: &categorizedNodes)
//
//// Print categorized nodes
//for (category, nodes) in categorizedNodes {
//    print("Category: \(category.rawValue)")
//    for node in nodes {
//        print("  Node: \(node.name ?? "Unnamed")")
//    }
//}
