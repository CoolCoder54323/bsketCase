//
//  GameViewController.swift
//  BasketCase
//
//  Created by Nicholas Dixon on 5/26/18.
//  Copyright © 2018 Nicholas Dixon. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameViewController: UIViewController {
    
    
    @IBOutlet weak var menuVeiw: UIView!
    
    @IBOutlet weak var startButton:UIButton?
    
    @IBOutlet weak var `continue`: UIButton!
    
    @IBOutlet weak var menuBorder: UIImageView!
    
    
    @IBAction func goToMainMenu(_ sender: Any) {
        
        let game = mainStoryboard.instantiateViewController(withIdentifier:"GVC")
        let scene = SKScene(fileNamed: "GameScene") as? GameScene
        scene?.removeAllChildren()
        scene?.music().removeFromParent()
        self.dismiss(animated: false, completion: nil)
        present(game, animated: false, completion: nil)
        
    }
    
    @IBAction func continueButtonPressed(_ sender: Any) {
        

        menuVeiw.isHidden = true
        if let scene = SKScene(fileNamed: "GameScene") as? GameScene {
            
        }
    }
    
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuVeiw.isHidden = true
        

        

        menuBorder.layer.magnificationFilter = kCAFilterNearest
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            startButton?.isHidden = true
            if let scene = SKScene(fileNamed: "GameScene") as? GameScene {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                scene.ownerGameViewController = self
                //                scene.startTimer()
                // Present the scene
                scene.physicsWorld.contactDelegate = scene as SKPhysicsContactDelegate
                
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
                view.showsFPS = true
                view.showsNodeCount = true
                var s = UserDefaults.standard
            }
        }
    }

    @IBAction func startButtonPressed(_ sender: Any)  {
       

    }
    
    func nextScene() {
        guard let window = UIApplication.shared.delegate?.window, let menuViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainMenu") as? MMViewController else { return }
        window?.rootViewController = menuViewController
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
}
