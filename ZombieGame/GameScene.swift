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
    
    var background = SKSpriteNode(imageNamed:"background1")
   let zombie = SKSpriteNode(imageNamed:"zombie1")

   var zombieIsTouched = false
    
    var moveForward = true

    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.purple
        // this is to bring the background into center
//        background.position =   CGPoint(x: size.width/2, y: size.height/2)
//        background.zRotation = CGFloat(M_PI) / 8
//        background.anchorPoint = CGPoint(x: 0.5, y: 0.5) // default
//        background.zPosition = -1
//        addChild(background)
        createBackground()
        
         // this is to bring the zombie into center
         zombie.position =   CGPoint(x: size.width/2, y: size.height/2)
        //background.zRotation = CGFloat(M_PI) / 8
         zombie.anchorPoint = CGPoint(x: 0.5, y: 0.5) // default
//       zombie.zPosition = -1  this is to set z postion which means at which level of the stack of screen we wants to put it on
         addChild(zombie)
                }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if zombie.contains(touch.location(in: self)) {
                zombieIsTouched = true
                zombie.size = CGSize(width: zombie.size.width*2, height: zombie.size.height*2)
//                 zombie.setScale(2)  this is used for increasing the size
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (zombieIsTouched){
            zombie.size = CGSize(width: zombie.size.width/2, height: zombie.size.height/2)
            zombieIsTouched = false
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (zombieIsTouched == true) {
            zombie.position = touches.first?.location(in: self) as! CGPoint
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if moveForward{
            zombie.position = CGPoint(x: zombie.position.x + 8,
                  y: zombie.position.y)
        }
        else{
            zombie.position = CGPoint(x: zombie.position.x - 8,
            y: zombie.position.y)
        }
        
    }
    
    override func didEvaluateActions() {
    
    }
    
    override func didSimulatePhysics() {
    
    }
    
    override func didApplyConstraints() {
        
    }
    
    override func didFinishUpdate() {
        if zombie.position.x == size.width{
            moveForward = false
        }
        if zombie.position.x == 0 {
            moveForward = true
        }
        
    }
    
    
     func createBackground() {
              let backgroundTexture = SKTexture(imageNamed: "background1")

              for i in 0 ... 1{
                  let background = SKSpriteNode(texture: backgroundTexture)
                  background.zPosition = -1
                  background.anchorPoint = CGPoint(x: 0, y: 0.5)
                  background.position = CGPoint(x:  (backgroundTexture.size().width * CGFloat(i)) - CGFloat(1 * i), y: size.height/2)
                let moveLeft = SKAction.moveBy(x: -backgroundTexture.size().width, y: 0, duration: 10)
                let moveReset = SKAction.moveBy(x: backgroundTexture.size().width, y: 0, duration: 0)
                let moveLoop = SKAction.sequence([moveLeft, moveReset])
                let moveForever = SKAction.repeatForever(moveLoop)

                background.run(moveForever)
                addChild(background)
              }
          }
}

