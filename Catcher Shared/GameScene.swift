//
//  GameScene.swift
//  Catcher Shared
//
//  Created by mark on 11/10/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var player = Player()
    var foodList: Set<Food> = []
    
    func setUpScene() {
        placePlayer()
        spawnFood()
    }
    
    func placePlayer() {
        // Center the player horizontally and place it 1/8 off the bottom of the screen.
        let startX = size.width / 2
        let startY = size.height / 8
        
        player.sprite.node.position = CGPoint(x: startX, y: startY)
        player.sprite.node.entity = player
        addChild(player.sprite.node)
    }
    
    func spawnFood() {
        // Spawn the food at the top of the scene at a random horizontal spot.
        let randomGenerator = GKRandomDistribution(lowestValue: 0, highestValue: Int(size.width))
        let x = randomGenerator.nextInt()
        let y = Int(size.height)
        
        let newFood = Food(location: CGPoint(x: x, y: y))
        newFood.sprite.node.position = CGPoint(x: x, y: y)
        
        // Set the food's entity so we don't have a nil entity when doing collision detection.
        newFood.sprite.node.entity = newFood
        
        foodList.insert(newFood)
        addChild(newFood.sprite.node)
    }
    
    override func didMove(to view: SKView) {
        self.setUpScene()
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        dropFood()
    }
    
    func dropFood() {
        let dropSpeed = -10.0
        
        for food in foodList {
            food.transform.translate(CGVector(dx: 0, dy: dropSpeed))
        }
    }
}
