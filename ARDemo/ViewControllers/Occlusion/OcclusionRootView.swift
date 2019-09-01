//
//  OcclusionRootView.swift
//  ARDemo
//
//  Created by Daniel Reyes Sanchez on 9/1/19.
//  Copyright © 2019 Wizeline. All rights reserved.
//

import UIKit
import RealityKit
import ARKit

final class OcclusionRootView: NiblessView {
    
    private let arView = ARView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        loadModel(named: "vase")
    }
    
    private func setupUI() {
        backgroundColor = .white
        addSubview(arView)
        arView.pinToSuperview()
        arView.session.delegate = self
    }
    
    private func loadModel(named model: String) {
        do {
            let vase = try ModelEntity.load(named: model)
            
            // Place model on a horizontal plane.
            let anchor = AnchorEntity(plane: .horizontal, minimumBounds: [0.15, 0.15])
            arView.scene.anchors.append(anchor)
            
            vase.scale = [1, 1, 1] * 0.006
            anchor.children.append(vase)
        } catch {
            fatalError("Failed to load asset.")
        }
    }
    
    private func addCoachingView() {
        
    }
    
    func startPeopleOcclusion() {
        guard let config = arView.session.configuration as? ARWorldTrackingConfiguration,
            ARWorldTrackingConfiguration.supportsFrameSemantics(.personSegmentationWithDepth) else {
                fatalError("People occlusion is not supported on this device.")
        }

        config.frameSemantics.insert(.personSegmentationWithDepth)

        arView.session.run(config)
    }
}

extension OcclusionRootView: ARSessionDelegate {
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        startPeopleOcclusion()
    }
}
