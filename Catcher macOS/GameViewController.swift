//
//  GameViewController.swift
//  Catcher macOS
//
//  Created by mark on 11/10/22.
//

import Cocoa
import SpriteKit
import GameplayKit

class GameViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.bounds.size)
        scene.backgroundColor = .cyan
        scene.scaleMode = .resizeFill
        
        // Present the scene
        let skView = self.view as! SKView
        skView.presentScene(scene)
        
        skView.ignoresSiblingOrder = true
        
    }

}

