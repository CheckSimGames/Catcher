//
//  GameScene.swift
//  Catcher Shared
//
//  Created by mark on 11/10/22.
//

import SpriteKit

class GameScene: SKScene {
    
    var player = Player()
    
    func setUpScene() {
        placePlayer()
    }
    
    func placePlayer() {
        // Center the player horizontally and place it 1/8 off the bottom of the screen.
        let startX = size.width / 2
        let startY = size.height / 8
        
        player.sprite.node.position = CGPoint(x: startX, y: startY)
        player.sprite.node.entity = player
        addChild(player.sprite.node)
    }
    
    override func didMove(to view: SKView) {
        self.setUpScene()
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

#if os(iOS) || os(tvOS)
// Touch-based event handling
extension GameScene {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {

        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {

        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {

        }
    }
    
   
}
#endif
