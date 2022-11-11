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
    var spawnTimer = Timer()
    
    func setUpScene() {
        placePlayer()
        startTimer()
        // You need to set the contact delegate for the collision detection functions in the extension to be called. Those functions are later in the file.
        physicsWorld.contactDelegate = self
    }
    
    func placePlayer() {
        // Center the player horizontally and place it 1/8 off the bottom of the screen.
        let startX = size.width / 2
        let startY = size.height / 8
        
        player.sprite.node.position = CGPoint(x: startX, y: startY)
        player.sprite.node.entity = player
        addChild(player.sprite.node)
    }
    
    func startTimer() {
        spawnTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {_ in
            self.spawnFood()
        })
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
        let dropSpeed = -5.0
        
        for food in foodList {
            food.transform.translate(CGVector(dx: 0, dy: dropSpeed))
        }
    }
}

/// Collision code
extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        let entityA = contact.bodyA.node?.entity
        let entityB = contact.bodyB.node?.entity

        if let notifiableEntity = entityA as? ContactNotifiable, let otherEntity = entityB {
            notifiableEntity.contactDidBegin(with: otherEntity)
        }

        if let notifiableEntity = entityB as? ContactNotifiable, let otherEntity = entityA {
            notifiableEntity.contactDidBegin(with: otherEntity)
        }
    }

    func didEnd(_ contact: SKPhysicsContact) {
        let entityA = contact.bodyA.node?.entity
        let entityB = contact.bodyB.node?.entity

        if let notifiableEntity = entityA as? ContactNotifiable, let otherEntity = entityB {
            notifiableEntity.contactDidEnd(with: otherEntity)
        }

        if let notifiableEntity = entityB as? ContactNotifiable, let otherEntity = entityA {
            notifiableEntity.contactDidEnd(with: otherEntity)
        }
    }
}
