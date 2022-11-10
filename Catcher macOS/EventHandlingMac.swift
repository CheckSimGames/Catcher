//
//  EventHandlingMac.swift
//  Catcher
//
//  Created by mark on 11/10/22.
//

import Foundation
import SpriteKit

extension GameScene {

    override func keyDown(with event: NSEvent) {
        let keyCode: UInt16 = event.keyCode
        let amountToMove = 40.0
        
        switch keyCode {
        case 0x7B:
            // Left arrow key pressed. Move left
            player.transform.translate(CGVector(dx: amountToMove * -1.0, dy: 0.0))
        case 0x7C:
            // Right arrow key pressed. Move right
            player.transform.translate(CGVector(dx: amountToMove, dy: 0.0))
        default:
            return
        }
    }
    
    override func mouseDown(with event: NSEvent) {

    }
    
    override func mouseDragged(with event: NSEvent) {

    }
    
    override func mouseUp(with event: NSEvent) {

    }

}
