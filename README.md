# Catcher

A simple game showing how to use the GameplayKit entity component system in a SpriteKit game.

## System Requirements

* iOS 11+
* macOS 10.13+

I created the project in Xcode 14 and wrote the code in Swift 5.

I haven't tested the project in earlier versions of Xcode. I see no reason why the project wouldn't work in Xcode 13.

## How to Play

Drag the mouse (Mac) or touch the screen and drag (iOS) to move the player sprite.

Catch the falling objects from the top of the screen.

The game ends when a falling object hits the ground at the bottom of the screen.

## Code Files

The `Food.swift`, `Ground.swift`, and `Player.swift` files in the Shared folder have the code for the GameplayKit entities.

The `PhysicsComponent.swift`, `SpriteComponent.swift`, and `TransformComponent.swift` files in the Shared folder have the code for the GameplayKit components.

The `ContactNotifiable.swift` and `PhysicsBody.swift` files have code for the collision detection along with the extension file at the end of the `GameScene.swift` file. The files are in the Shared folder.
