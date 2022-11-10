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
        
        // I may need to set the scale mode if things don't look right. The .aspectFill scale mode is in the Apple code for a new project.
        
        // Present the scene
        let skView = self.view as! SKView
        skView.presentScene(scene)
        
        skView.ignoresSiblingOrder = true
        
    }

}

