//
//  homeScreen.swift
//  BasketCase
//
//  Created by Nicholas Dixon on 6/12/18.
//  Copyright © 2018 Nicholas Dixon. All rights reserved.
//

import Foundation
import UIKit

class homeScreenViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var logo: UIImageView!
//    @IBOutlet weak var highScoreLabel: UILabel!
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)

    
    override func viewDidLoad() {
        
        playButton.layer.magnificationFilter = kCAFilterNearest

        logo.layer.magnificationFilter = kCAFilterNearest
        

        
    }






    @IBAction func playButtonPressed(_ sender: Any) {
        
        var game = mainStoryboard.instantiateViewController(withIdentifier:"GVC")

        present(game, animated: false, completion: nil)

    }
    


}

