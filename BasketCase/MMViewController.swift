//
//  MainMenuGameViewController.swift
//  BasketCase
//
//  Created by Nicholas Dixon on 6/9/18.
//  Copyright © 2018 Nicholas Dixon. All rights reserved.
//

import Foundation
import UIKit
import GameKit

class MMViewController: UIViewController {
    
    
    
  
    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        startButton?.setBackgroundImage(#imageLiteral(resourceName: "sprite_0"), for: .normal)
        startButton?.setBackgroundImage(#imageLiteral(resourceName: "sprite_1"), for: .highlighted)
//        
//        startButton.setBackgroundImage(#imageLiteral(resourceName: "sprite_0"), for: .normal)
//        startButton.setBackgroundImage(#imageLiteral(resourceName: "sprite_1"), for: .highlighted)
//        var to = "m"
   }
//    
//    
//    
   @IBAction func Start(_ sender: Any) {

    
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)

        var game = mainStoryboard.instantiateViewController(withIdentifier:"homeScreen")
    
        present(game, animated: false, completion: nil)
//        
//        if let view = self.view as? SKView? {
//            // Load the SKScene from 'GameScene.sks'
//            startButton.isHidden = true
//            if let scene = SKScene(fileNamed: "GameScene") as? GameScene {
//                // Set the scale mode to scale to fit the window
//                scene.scaleMode = .aspectFill
//                //                scene.startTimer()
//                // Present the scene
//                scene.physicsWorld.contactDelegate = scene as! SKPhysicsContactDelegate
//                
//                view?.presentScene(scene)
//                view?.ignoresSiblingOrder = true
//                view?.showsFPS = true
//                view?.showsNodeCount = true
//            }
//        }
    
    }



}
