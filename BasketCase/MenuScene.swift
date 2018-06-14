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

class MenuScene: SKScene,SKPhysicsContactDelegate {
    
    var something: SKLabelNode?

    
    override func didMove(to view: SKView) {
        
        
        something?.fontSize = 100
        something!.text = "IT worked"
        something!.fontColor = UIColor.brown
        addChild(something!)
    
}
    
    
    
    
    
    
    
    
    
}

