//
//  GameScene.swift
//  ZombieGame
//
//  Created by vipul garg on 2020-06-08.
//  Copyright © 2020 VipulGarg. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
   let background = SKSpriteNode(imageNamed:"background1")
   let zombie = SKSpriteNode(imageNamed:"zombie1")

   var zombieIsTouched = false

    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.purple
        // this is to bring the background into center
        background.position =   CGPoint(x: size.width/2, y: size.height/2)
//        background.zRotation = CGFloat(M_PI) / 8
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5) // default
        background.zPosition = -1
        addChild(background)
        
         // this is to bring the background into center
         zombie.position =   CGPoint(x: size.width/2, y: size.height/2)
        //background.zRotation = CGFloat(M_PI) / 8
         zombie.anchorPoint = CGPoint(x: 0.5, y: 0.5) // default
//       zombie.zPosition = -1
         addChild(zombie)
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if zombie.contains(touch.location(in: self)) {
                zombieIsTouched = true
            } else {
                zombieIsTouched = false
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (zombieIsTouched == true) {
            zombie.position = touches.first?.location(in: self) as! CGPoint
        }
    }  
}

