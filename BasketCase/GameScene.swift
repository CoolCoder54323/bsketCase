//
//  GameScene.swift
//  BasketCase
//
//  Created by Nicholas Dixon on 5/26/18.
//  Copyright © 2018 Nicholas Dixon. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene,SKPhysicsContactDelegate {
   private let spriteCategory: UInt32 = 0x1 << 0
    var timer:Timer!
    
    public var ownerGameViewController: GameViewController?
    public var life = 3
    public var score = 1
    public var heart1 = SKSpriteNode(imageNamed: "heartAlive")
    public var heart2 = SKSpriteNode(imageNamed: "heartAlive")
    public var heart3 = SKSpriteNode(imageNamed: "heartAlive")
//Family: STF_ELEVATED Font names: ["STF_ELEVATED"]
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        var rimTouch = false

        let main = UIStoryboard(name: "Main", bundle: nil)
        let loseScreen = main.instantiateViewController(withIdentifier: "lose")
       
        let basketBall = childNode(withName: "basketBall") as? SKSpriteNode

        if (contact.bodyA.categoryBitMask == UInt32(4) && contact.bodyB.categoryBitMask == UInt32(12)) ||
            (contact.bodyA.categoryBitMask == UInt32(12) && contact.bodyB.categoryBitMask == UInt32(4)){
            print("ball and right wall")
            let bounce3 = SKAction.applyImpulse(CGVector(dx: -5000, dy: 0), duration: 0.1)
            basketBall?.run(bounce3)
        }

        if (contact.bodyA.categoryBitMask == UInt32(4) && contact.bodyB.categoryBitMask == UInt32(6)) ||
           (contact.bodyA.categoryBitMask == UInt32(6) && contact.bodyB.categoryBitMask == UInt32(4)){
             print("ball and left wall")
           let bounce = SKAction.applyImpulse(CGVector(dx: 5000, dy: 0), duration: 0.1)
            basketBall?.run(bounce)
        }
//            basketBall?.physicsBody?.velocity = CGVector(dx: 100, dy: 50)
            if (contact.bodyA.categoryBitMask == UInt32(4) && contact.bodyB.categoryBitMask == UInt32(7)) ||
                (contact.bodyA.categoryBitMask == UInt32(7) && contact.bodyB.categoryBitMask == UInt32(4)){
                
                print("ball and ground")


                life -= 1
                if life == 2 {
                    heart1.texture = SKTexture(image: UIImage(named: "heartDead")!)
                    heart1.texture?.filteringMode = .nearest

                }
                if life == 1 {
                    heart2.texture = SKTexture(image: UIImage(named: "heartDead")!)
                    heart2.texture?.filteringMode = .nearest

                }
                if life == 0 {
                    heart3.texture = SKTexture(image: UIImage(named: "heartDead")!)
                    heart3.texture?.filteringMode = .nearest
                    
                    ownerGameViewController?.dismiss(animated: false, completion: nil)
                    ownerGameViewController?.present(loseScreen, animated: false, completion: nil)

                }
                
                let bounce2 = SKAction.applyImpulse(CGVector(dx: 0, dy: 5000), duration: 0.1)
                basketBall?.run(bounce2)
        }
    
        basketBall?.texture?.filteringMode = SKTextureFilteringMode.nearest
        if (contact.bodyA.categoryBitMask == UInt32(4) && contact.bodyB.contactTestBitMask == UInt32(4) ||
            contact.bodyA.contactTestBitMask == UInt32(4) && contact.bodyB.categoryBitMask == UInt32(4)) {
            
            print("detected1")
            rimTouch = true
            
        }
        if (contact.bodyA.categoryBitMask == UInt32(4) && contact.bodyB.contactTestBitMask == UInt32(7) ||
            contact.bodyA.contactTestBitMask == UInt32(7) && contact.bodyB.categoryBitMask == UInt32(4)) {
            
            
            if (rimTouch == true) {
                print("detecter2")
                scored(points: 1)
                rimTouch = false
            }
        }
    }
    
    public let scoreLabel: UILabel = UILabel(frame:CGRect(x: 150, y: 41, width: 100, height: 100))

    func scored(points:Int) {
        print("score!!!!")
        score += points
        scoreLabel.text = "\(score)"
    }
    

    override func didMove(to view: SKView) {
        heart1.position = CGPoint(x: 300, y: 500)
        heart2.position = CGPoint(x: 225, y: 500)
        heart3.position = CGPoint(x: 150, y: 500)
        heart1.zPosition = 100
        heart2.zPosition = 101
        heart3.zPosition = 102
        heart1.size = CGSize(width: 150, height: 150)
        heart2.size = CGSize(width: 150, height: 150)
        heart3.size = CGSize(width: 150, height: 150)

        
        addChild(heart1)
        addChild(heart2)
        addChild(heart3)
        
        
        addChild(music())
        scoreLabel.textAlignment = NSTextAlignment.center
        scoreLabel.text = "0"
        scoreLabel.font = UIFont(name: "STF_ELEVATED", size: 100)
        scoreLabel.layer.zPosition = 100
        self.scene?.view?.addSubview(scoreLabel)
//        scoreLabel.sizeToFit()

        


        
        
        let solidBackboard = childNode(withName: "solidBackboard") as? SKSpriteNode
        let unSolidBackboard = childNode(withName: "unsolidBackboard") as? SKSpriteNode
        let backGround = childNode(withName: "background") as? SKSpriteNode
        let floor = childNode(withName: "floor") as? SKSpriteNode
        let net = childNode(withName: "net") as? SKSpriteNode
        let rim = childNode(withName: "rim") as? SKSpriteNode
        let stand = childNode(withName: "stand") as? SKSpriteNode
        let otherRim = childNode(withName: "otherRim") as? SKSpriteNode
        let backBouncer = childNode(withName: "backBouncer") as? SKSpriteNode
        let frontRim = childNode(withName: "frontRim") as? SKSpriteNode
        let detecter1 = childNode(withName: "detecter1") as? SKSpriteNode
        let detecter2 = childNode(withName: "detecter2") as? SKSpriteNode


        solidBackboard?.texture?.filteringMode = .nearest
        unSolidBackboard?.texture?.filteringMode = .nearest
        backGround?.texture?.filteringMode = .nearest
        floor?.texture?.filteringMode = .nearest
        net?.texture?.filteringMode = .nearest
        rim?.texture?.filteringMode = .nearest
        stand?.texture?.filteringMode = .nearest
        otherRim?.texture?.filteringMode = .nearest
        backBouncer?.texture?.filteringMode = .nearest
        frontRim?.texture?.filteringMode = .nearest
        heart1.texture?.filteringMode = .nearest
        heart2.texture?.filteringMode = .nearest
        heart3.texture?.filteringMode = .nearest
        
        let gameScore = 0

        detecter1?.physicsBody?.contactTestBitMask = UInt32(4)
        detecter2?.physicsBody?.contactTestBitMask = UInt32(7)

        scoreLabel.text = "\(gameScore)"
        physicsWorld.contactDelegate = self



        var textureArray = [SKTexture]()
        for index in 0 ... 34 {
            let textureName = "BackgroundAnimation\(index)"
            let texture = SKTexture(imageNamed: textureName)
            textureArray.append(texture)
            print(index)
        }
        let animate = SKAction.animate(with: textureArray, timePerFrame: 0.1)
        let forever = SKAction.repeatForever(animate)
        backGround?.run(forever)
        

        
    }
    func music() -> SKAudioNode {
        let musicURL = Bundle.main.url(forResource: "BackgroundMusic", withExtension: "mp3")
        var backgorundMusic = SKAudioNode(url: musicURL!)
        backgorundMusic.autoplayLooped = true

        
        return backgorundMusic
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        moveBack(y: 100, x: 100)
    }
    
    @objc func moveBack(y:Int,x:Int) {
        let basketBall = childNode(withName: "basketBall") as? SKSpriteNode
        let n = SKAction.moveTo(x: CGFloat(x) , duration: 0)
        let b = SKAction.moveTo(y: CGFloat(y), duration: 0)
        basketBall?.zPosition = CGFloat(integerLiteral: 10)
        basketBall?.run(n)
        basketBall?.run(b)
    }

     func startTimer() {

        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(moveBack), userInfo: nil, repeats: true)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let menu = childNode(withName: "menu") as? SKSpriteNode
        let touch = touches.first!
        if (menu?.contains(touch.location(in: self)))! {
            
//            print("touched")
//            var transition:SKTransition = SKTransition.fade(withDuration: 0)
//            var menuScene:SKScene = MenuScene(size: self.size)
//            self.view?.presentScene(menuScene, transition: transition)
                        ownerGameViewController?.menuVeiw.isHidden = false
            }
            
        else {
            let sound = SKAction.playSoundFileNamed("1boing.mp3", waitForCompletion: false)
            let basketBall = childNode(withName: "basketBall") as? SKSpriteNode
            let positionOfTouch = touch.location(in: self)
            let jumpUpAction = SKAction.applyImpulse(CGVector(dx:(positionOfTouch.x - (basketBall?.position.x)!) * 25 , dy: (positionOfTouch.y - (basketBall?.position.y)!) * 25), duration:  0.1)
            
            print(positionOfTouch)
            // move down 20
            // sequence of move yup then down
            let jumpSequence = SKAction.sequence([jumpUpAction])
            basketBall?.physicsBody?.isDynamic = true

            // make player run sequence
            basketBall?.run(jumpSequence)
            run(sound)
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
     

    }
}


class HighScore: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
    }
    
    
    @objc(_TtCC10BasketCase9HighScore9HighScore)class HighScore: NSObject, NSCoding {
        func encode(with aCoder: NSCoder) {
            
        }
        
        let score:Int;
        
        init(score:Int, dateOfScore:NSDate) {
            self.score = score;
        }
        
        required init(coder: NSCoder) {
            self.score = coder.decodeObject(forKey: "score")! as! Int;
            super.init()
        }
        
        func encodeWithCoder(coder: NSCoder) {
            coder.encode(self.score, forKey: "score")
        }
    }
}

