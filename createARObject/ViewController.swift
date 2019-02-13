//
//  ViewController.swift
//  createARObject
//
//  Created by Dilip Gurjar on 13/02/19.
//  Copyright © 2019 Dilip Gurjar. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
      
       let scene = SCNScene(named: "art.scnassets/table.scn")!
       // let scene = SCNScene()
        sceneView.scene = scene
       // createShape()
        addLight()
    }
    
    func createShape() {
        let pyramid = SCNPyramid(width: 0.2, height: 0.2, length: 0.2)
        pyramid.firstMaterial?.diffuse.contents = UIColor.blue
        let pyramidNode = SCNNode(geometry: pyramid)
        pyramidNode.position.z = -0.8
        sceneView.scene.rootNode.addChildNode(pyramidNode)
        
        // Box
        let box = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
        box.firstMaterial?.diffuse.contents = UIColor.red
        let boxNode = SCNNode(geometry: box)
        boxNode.position = SCNVector3Make(-0.5, 0, -0.8)
        sceneView.scene.rootNode.addChildNode(boxNode)
        
        let spear = SCNSphere(radius: 0.15)
        spear.firstMaterial?.diffuse.contents = UIColor.yellow
        let spearNode = SCNNode(geometry: spear)
        spearNode.position = SCNVector3Make(0.5, 0, -0.8)
        sceneView.scene.rootNode.addChildNode(spearNode)
        
    }
    
    func addLight() {
        let directional = SCNLight()
        directional.type = .directional
        let directionalNode = SCNNode()
        directionalNode.light = directional
        directionalNode.eulerAngles.x = -.pi/4
        sceneView.scene.rootNode.addChildNode(directionalNode)
        
        let ambiyant = SCNLight()
        ambiyant.type = .ambient
        let ambiyantNode = SCNNode()
        ambiyantNode.light = ambiyant
        let color = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        ambiyant.color = color
        sceneView.scene.rootNode.addChildNode(ambiyantNode)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
