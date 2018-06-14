//
//  menuScene.swift
//  BasketCase
//
//  Created by Nicholas Dixon on 6/3/18.
//  Copyright © 2018 Nicholas Dixon. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class MenuScene: SKScene {
    
    var something: SKLabelNode? = SKLabelNode(text: "It WORKED")
    var backgroundMusic: SKAudioNode!


    override func didMove(to view: SKView) {
      
        let ContinueButton:UIButton = UIButton.init()
        ContinueButton.setBackgroundImage(#imageLiteral(resourceName: "continueButton0"),for: .normal)
        ContinueButton.setBackgroundImage(#imageLiteral(resourceName: "continueButton1"),for: .highlighted)
        ContinueButton.bounds = CGRect(x: 0, y: 0, width: 200, height: 100)
        ContinueButton.center = CGPoint(x: 100, y: 100)
        view.addSubview(ContinueButton)

        something?.fontSize = 100
        something?.position = CGPoint(x: 500, y: 500)
        something?.fontColor = UIColor.brown
        addChild(something!)
    
        ContinueButton.addTarget(self, action: #selector(switchBack), for: .touchUpInside)
}

@objc    func switchBack(s : AnyObject){
        let transition:SKTransition = SKTransition.fade(withDuration: 0)
        let gameScene:SKScene = GameScene(size: self.size)
        self.view?.presentScene(gameScene, transition: transition)
    }
    
    
    
    
    
    
    
    
}

