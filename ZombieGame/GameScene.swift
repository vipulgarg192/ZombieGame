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
   let zombieAnimation: SKAction

   var zombieIsTouched = false
    
    var moveForward = true
    
    var lastPostion : Int = 0
    var newPostion  : Int = 0

    override init(size: CGSize) {
      
        var textures:[SKTexture] = []
        // 2
        for i in 1...4 {
         textures.append(SKTexture(imageNamed: "zombie\(i)"))
        }
        // 3
        textures.append(textures[2])
        textures.append(textures[1])
        // 4
        zombieAnimation = SKAction.animate(with: textures,
         timePerFrame: 0.1)
       super.init(size: size) // 5
      }
      
    required init(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
      }
    
    
    override func didMove(to view: SKView) {
        // working
//        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)

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
        background.zRotation = +10
         zombie.anchorPoint = CGPoint(x: 0.5, y: 0.5) // default
//       zombie.zPosition = -1  this is to set z postion which means at which level of the stack of screen we wants to put it on
         addChild(zombie)
         zombie.run(SKAction.repeatForever(zombieAnimation)) 
        
    // this will create a frame boarder of the scene
//        zombie.physicsBody = SKPhysicsBody(rectangleOf: zombie.size)
        
        
        run(SKAction.repeatForever(
          SKAction.sequence([
            SKAction.run(spawnEnemy),
            SKAction.wait(forDuration: 1.0)
            ])
        ))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Working
//        if let touch = touches.first {
//            if zombie.contains(touch.location(in: self)) {
//                zombieIsTouched = true
//                zombie.size = CGSize(width: zombie.size.width*2, height: zombie.size.height*2)
////                 zombie.setScale(2)  this is used for increasing the size
//            }
//        }
        
        // ---------------------
        
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
        // working
//        print("new",newPostion)
//        newPostion  = Int(zombie.position.x)
//        print("last",lastPostion)
//
//        if moveForward{
//            zombie.position = CGPoint(x: zombie.position.x + 8,
//                                           y: zombie.position.y)
//
//        }
//        else{
//            zombie.position = CGPoint(x: zombie.position.x - 8,
//            y: zombie.position.y)
//        }
        
        
        
        
    }
    
    override func didEvaluateActions() {
    
    }
    
    override func didSimulatePhysics() {
    
    }
    
    override func didApplyConstraints() {
        
    }
    
    // working
    
//    override func didFinishUpdate() {
//        print(zombie.position.x)
//        lastPostion = Int(zombie.position.x)
//        if zombie.position.x == size.width{
//            moveForward = false
//        }
//        if zombie.position.x == 0 {
//            moveForward = true
//        }
//
//    }
    
    
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
    
    func spawnEnemy() {
        let enemy = SKSpriteNode(imageNamed: "enemy")
        
         let actualY = CGFloat.random(min: enemy.size.height/2, max: size.height - enemy.size.height/2)
        
        
    // Position the monster slightly off-screen along the right edge,
    // and along a random position along the Y axis as calculated above
       enemy.position = CGPoint(x: size.width + enemy.size.width/2, y: actualY)
        addChild(enemy)
        
//        let actualDuration = CGFloat.random(min: CGFloat(2.0), max: CGFloat(4.0))
        
        // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: -enemy.size.width/2, y: actualY),
                                       duration: TimeInterval(4))
        let actionMoveDone = SKAction.removeFromParent()
        enemy.run( SKAction.sequence([actionMove, actionMoveDone]))

        
    }
    
    
}

