//
//  Food.swift
//  Catcher
//
//  Created by mark on 11/11/22.
//

import Foundation
import GameplayKit

class Food: GKEntity {
    let sprite = SpriteComponent()
    let transform = TransformComponent()
    
    init(location: CGPoint) {
        super.init()
        sprite.node = SKSpriteNode(color: .white, size: CGSize(width: 32, height: 32))
        sprite.node.position = location
        addComponent(sprite)
        
        addComponent(transform)
        transform.set(node: sprite.node)
        
        let physicsComponent = PhysicsComponent(physicsBody: SKPhysicsBody(rectangleOf: CGSize(width: sprite.node.size.width, height: sprite.node.size.height)))
        physicsComponent.physicsBody.affectedByGravity = false
        addComponent(physicsComponent)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Collision handling code
extension Food: ContactNotifiable {
    func contactDidBegin(with entity: GKEntity) {
        if entity is Player {
            sprite.node.removeFromParent()
        }
    }
    
    func contactDidEnd(with entity: GKEntity) {
        
    }
}