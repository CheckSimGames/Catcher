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
    var ground = Ground(width: 256)
    var dropSpeed = -4.0
    var spawnTimer = Timer()
    var dropSpeedTimer = Timer()
    var scoreLabel = SKLabelNode()
    
    func setUpScene() {
        placePlayer()
        startTimers()
        setupLabel()
        setupGround()
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
    
    func startTimers() {
        spawnTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {_ in
            self.spawnFood()
        })
        
        spawnTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true, block: {_ in
            self.increaseDropSpeed()
        })
    }
    
    func spawnFood() {
        // Spawn the food at the top of the scene at a random horizontal spot.
        let spriteSize = 32
        // Keep the food from getting cut off the edges of the screen.
        let randomGenerator = GKRandomDistribution(lowestValue: spriteSize, highestValue: Int(size.width) - spriteSize)
        let x = randomGenerator.nextInt()
        let y = Int(size.height)
        
        let newFood = Food(location: CGPoint(x: x, y: y))
        newFood.sprite.node.position = CGPoint(x: x, y: y)
        
        // Set the food's entity so we don't have a nil entity when doing collision detection.
        newFood.sprite.node.entity = newFood
        
        foodList.insert(newFood)
        addChild(newFood.sprite.node)
    }
    
    func setupLabel() {
        scoreLabel.position.x = 32
        scoreLabel.position.y = size.height - 32
        scoreLabel.text = String(player.score)
        scoreLabel.fontColor = .black
        scoreLabel.fontName = "Helvetica Bold"
        scoreLabel.horizontalAlignmentMode = .left
        addChild(scoreLabel)
    }
        
    func setupGround() {
        ground.sprite.node.size.width = self.size.width
        addChild(ground.sprite.node)
    }
    
    override func didMove(to view: SKView) {
        self.setUpScene()
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        dropFood()
        // TODO: Find a way to update the score label when the player grabs some food.
        scoreLabel.text = String(player.score)
    }
    
    func dropFood() {
        for food in foodList {
            food.transform.translate(CGVector(dx: 0, dy: dropSpeed))
        }
    }
    
    func increaseDropSpeed() {
        // Dropping is a negative number so to increase the speed, subtract.
        dropSpeed -= 0.5
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
