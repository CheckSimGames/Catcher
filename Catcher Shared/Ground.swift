//
//  Ground.swift
//  Catcher
//
//  Created by mark on 11/11/22.
//

import Foundation
import GameplayKit

class Ground: GKEntity {
    let sprite = SpriteComponent()
    
    init(width: Int) {
        super.init()
        sprite.node = SKSpriteNode(color: .gray, size: CGSize(width: width, height: 32))
        sprite.node.position = CGPoint(x: 0, y: 0)
        addComponent(sprite)
        
        let physicsComponent = PhysicsComponent(physicsBody: SKPhysicsBody(rectangleOf: CGSize(width: sprite.node.size.width, height: sprite.node.size.height)))
        physicsComponent.physicsBody.affectedByGravity = false
        addComponent(physicsComponent)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Collision handling code
extension Ground: ContactNotifiable {
    func contactDidBegin(with entity: GKEntity) {

    }
    
    func contactDidEnd(with entity: GKEntity) {
        
    }
}
