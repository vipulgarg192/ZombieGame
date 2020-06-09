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
    
   
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.purple
        let background = SKSpriteNode(imageNamed:"background1")
        // this is to bring the background into center
        background.position =   CGPoint(x: size.width/2, y: size.height/2)
//        background.zRotation = CGFloat(M_PI) / 8
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5) // default
        background.zPosition = -1
        addChild(background)
        
        let zombie = SKSpriteNode(imageNamed:"zombie1")
         // this is to bring the background into center
         zombie.position =   CGPoint(x: size.width/2, y: size.height/2)
        //background.zRotation = CGFloat(M_PI) / 8
         zombie.anchorPoint = CGPoint(x: 0.5, y: 0.5) // default
//       zombie.zPosition = -1
         addChild(zombie)
        }
    
  
}

