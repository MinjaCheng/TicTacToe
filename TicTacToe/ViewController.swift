//
//  ViewController.swift
//  TicTacToe
//
//  Created by Minja Cheng on 2020-12-15.
//

import UIKit

class ViewController: UIViewController {
    
    // Cross
    var currentPlayer = 1
    // The field is empty, no gamepiece has been layed yet
    var playedField = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    // Game has finished or not, has been a winner or draw
    var gameIsActive = true
    var count = 0
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func action(_ sender: AnyObject) {
        
        // if the field is empty (playedField is 0) and game is active, can continue play
        if (playedField[sender.tag-1] == 0 && gameIsActive == true) {
            playedField[sender.tag-1] = currentPlayer
            count += 1
            if (currentPlayer == 1) {
                sender.setImage(UIImage(named: "cross.png"), for: UIControl.State())
                currentPlayer = 2
            } else {
                sender.setImage(UIImage(named: "nought.png"), for: UIControl.State())
                currentPlayer = 1
            }
        }
        
        // Looping throuhg all winningCombinations
        for combination in winningCombinations {
            if playedField[combination[0]] != 0 && playedField[combination[0]] == playedField[combination[1]] && playedField[combination[1]] == playedField[combination[2]] {
                
                gameIsActive = false
                
                if playedField[combination[0]] == 1 {
                    label.text = "CROSS HAS WON!"
                    label.textColor = UIColor.black
                } else {
                    label.text = "NOUGHT HAS WON!"
                    label.textColor = UIColor.systemRed
                }
                
                label.isHidden = false
                playAgainButton.isHidden = false
            }
        }
        
        if gameIsActive == true {
        
            if count >= 9 && gameIsActive == true {
                label.text = "It was a draw!"
                label.textColor = UIColor.black
                label.isHidden = false
                playAgainButton.isHidden = false
                gameIsActive = false
            }
        }
    }
    
    @IBAction func playAgainButton(_ sender: Any) {
    
        currentPlayer = 1
        playedField = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        label.isHidden = true
        playAgainButton.isHidden = true
        count = 0
        
        for i in 1...9 {
            let button = self.view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
