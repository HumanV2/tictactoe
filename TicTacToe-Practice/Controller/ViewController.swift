//
//  ViewController.swift
//  TicTacToe-Practice
//
//  Created by Borchert, Otto on 2/22/20.
//  Finished by Ben Brown on 4/9/20
//  Copyright © 2020 Borchert, Otto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var upperLeft: UIImageView!
    @IBOutlet var upperMiddle: UIImageView!
    @IBOutlet var upperRight: UIImageView!
    @IBOutlet var centerLeft: UIImageView!
    @IBOutlet var centerMiddle: UIImageView!
    @IBOutlet var centerRight: UIImageView!
    @IBOutlet var bottomLeft: UIImageView!
    @IBOutlet var bottomMiddle: UIImageView!
    @IBOutlet var bottomRight: UIImageView!
    // Status label
    @IBOutlet weak var statusLabel: UILabel!
    // Score labels
    @IBOutlet weak var xWinsLabel: UILabel!
    @IBOutlet weak var tieWinsLabel: UILabel!
    @IBOutlet weak var oWinsLabel: UILabel!
    // Timer
    var timer = Timer()
    var timeRemaining = 10
    
    @objc func updateTimer() {
        if timeRemaining >= 0 {
            statusLabel.text = "You have \(timeRemaining) left."
            timeRemaining -= 1
            
        }
        if timeRemaining <= -1 {
            board.reset()
            
            upperLeft.image = #imageLiteral(resourceName: "blank")
            upperMiddle.image = #imageLiteral(resourceName: "blank")
            upperRight.image = #imageLiteral(resourceName: "blank")
            centerLeft .image = #imageLiteral(resourceName: "blank")
            centerMiddle.image = #imageLiteral(resourceName: "blank")
            centerRight.image = #imageLiteral(resourceName: "blank")
            bottomLeft.image = #imageLiteral(resourceName: "blank")
            bottomMiddle.image = #imageLiteral(resourceName: "blank")
            bottomRight.image = #imageLiteral(resourceName: "blank")
            
            statusLabel.text = "It's \(board.getTurn())'s Turn"
            timer.invalidate()
            timeRemaining = 10
        }
    }
    
    var images: [[UIImageView]]? = nil
    
    //TODO: Create a model instance variable
    var board = TicTacToeBoard()
    var score = TotalWins()

    @IBAction func buttonClicked(_ sender: UIButton) {
        //Step 1 - Get the row number and column number from the button text (See hint in assignment instructions)
        timer.invalidate()
        
        let rowIndex = 0
        let columnIndex = 2
        
        let tempString = sender.currentTitle!
        let char0 = tempString.index(tempString.startIndex, offsetBy: rowIndex)
        let char1 = tempString.index(tempString.startIndex, offsetBy: columnIndex)
        let rowSpot = tempString[char0].wholeNumberValue!
        let columnSpot = tempString[char1].wholeNumberValue!
        
        //Step 2 - Place the marker in the *model*
        let placeMarker = board.placeMarker(row: rowSpot, column: columnSpot)
        //If placing was successful....
           //Step 3 - Get the turn from the *model* and place the appropriate image in the spot in the images array
        if placeMarker {
            let currentTurn = board.getTurn()
            if currentTurn == "X" {
                if rowSpot == 0 && columnSpot == 0 {
                    upperLeft.image = #imageLiteral(resourceName: "X")
                }
                else if rowSpot == 0 && columnSpot == 1 {
                    upperMiddle.image = #imageLiteral(resourceName: "X")
                }
                else if rowSpot == 0 && columnSpot == 2 {
                    upperRight.image = #imageLiteral(resourceName: "X")
                }
                else if rowSpot == 1 && columnSpot == 0 {
                    centerLeft.image = #imageLiteral(resourceName: "X")
                }
                else if rowSpot == 1 && columnSpot == 1 {
                    centerMiddle.image = #imageLiteral(resourceName: "X")
                }
                else if rowSpot == 1 && columnSpot == 2 {
                    centerRight.image = #imageLiteral(resourceName: "X")
                }
                else if rowSpot == 2 && columnSpot == 0 {
                    bottomLeft.image = #imageLiteral(resourceName: "X")
                }
                else if rowSpot == 2 && columnSpot == 1 {
                    bottomMiddle.image = #imageLiteral(resourceName: "X")
                }
                else if rowSpot == 2 && columnSpot == 2 {
                    bottomRight.image = #imageLiteral(resourceName: "X")
                }
            } // currentTurn = X
            if currentTurn == "O" {
                if rowSpot == 0 && columnSpot == 0 {
                    upperLeft.image = #imageLiteral(resourceName: "O")
                }
                else if rowSpot == 0 && columnSpot == 1 {
                    upperMiddle.image = #imageLiteral(resourceName: "O")
                }
                else if rowSpot == 0 && columnSpot == 2 {
                    upperRight.image = #imageLiteral(resourceName: "O")
                }
                else if rowSpot == 1 && columnSpot == 0 {
                    centerLeft.image = #imageLiteral(resourceName: "O")
                }
                else if rowSpot == 1 && columnSpot == 1 {
                    centerMiddle.image = #imageLiteral(resourceName: "O")
                }
                else if rowSpot == 1 && columnSpot == 2 {
                    centerRight.image = #imageLiteral(resourceName: "O")
                }
                else if rowSpot == 2 && columnSpot == 0 {
                    bottomLeft.image = #imageLiteral(resourceName: "O")
                }
                else if rowSpot == 2 && columnSpot == 1 {
                    bottomMiddle.image = #imageLiteral(resourceName: "O")
                }
                else if rowSpot == 2 && columnSpot == 2 {
                    bottomRight.image = #imageLiteral(resourceName: "O")
                }
            } // currentTurn = O
        } // placemarker
           //Step 4 - Check for a winner, updating the status message and creating a countdown timer to reset the game if necessary
           // Check the EggTimer assignment on Udemy for hints on creating the countdown timer
           // Make sure you reset the images to blank.png
        let winner = board.didWin()
        
        
        if winner == "X" {
            statusLabel.text = "X wins!"
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            score.addXWin()
            xWinsLabel.text = "\(score.getXWins())"
        } else if winner == "O" {
            statusLabel.text = "O wins!"
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            score.addOWin()
            oWinsLabel.text = "\(score.getOWins())"
        } else if winner == "T" {
            statusLabel.text = "It was a tie!"
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            score.addTieWin()
            tieWinsLabel.text = "\(score.getTieWins())"
        } else if placeMarker {
            board.nextTurn()
            statusLabel.text = "It's \(board.getTurn())'s turn!)"
        } else if placeMarker == false {
                statusLabel.text = "Invalid placement!"
        }
           //Step 5 - If no one won, make the *model* go to the next turn, get the current turn from the model and update the status message.
        
        
        //If placing the marker wasn't successful, change the status message, so the user knows what's wrong
        
    }
    //commit
    override func viewDidLoad() {
        super.viewDidLoad()

        // This loads the image array so it matches the model
        images = [[upperLeft, upperMiddle, upperRight],
                  [centerLeft, centerMiddle, centerRight],
                  [bottomLeft, bottomMiddle, bottomRight]]
        statusLabel.text = "It's \(board.getTurn())'s turn."
        xWinsLabel.text = "0"
    }

}

