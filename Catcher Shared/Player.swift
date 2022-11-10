//
//  Player.swift
//  Catcher
//
//  Created by mark on 11/10/22.
//

import Foundation
import GameplayKit

class Player: GKEntity {
    let sprite = SpriteComponent()
    
    override init() {
        super.init()
        
        sprite.node = SKSpriteNode(color: .red, size: CGSize(width: 128, height: 128))
        addComponent(sprite)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
