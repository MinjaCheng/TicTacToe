//
//  ViewController.swift
//  TicTacToe
//
//  Created by Minja Cheng on 2020-12-15.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 // Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]

    @IBAction func action(_ sender: AnyObject) {
        
        if (gameState[sender.tag-1] == 0) {
            gameState[sender.tag-1] = activePlayer
            
            if (activePlayer == 1) {
                sender.setImage(UIImage(named: "cross.png"), for: UIControl.State())
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "nought.png"), for: UIControl.State())
                activePlayer = 1
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

