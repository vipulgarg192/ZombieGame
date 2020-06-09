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
        
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        }
}
