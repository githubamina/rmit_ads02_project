//
//  ViewController.swift
//  Word Game
//
//  Created by Amina Qureshi on 20/3/18.
//  Copyright © 2018 Amina Qureshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets for the three labels
    @IBOutlet weak var currentWordLabel: UILabel!
    
    @IBOutlet weak var currentScoreLabel: UILabel!
    
    @IBOutlet weak var highScoreLabel: UILabel!
    
    //Outlet for the 10 buttons with images
    @IBOutlet var imageButtons: [UIButton]!
    
    //String array of the words to use in the game
    var wordList = ["Dog", "Cat", "Sun", "Moon", "Book", "Hat", "Ball", "Car", "Phone", "Key"]
    
    //Int variable to store the current game's score
    var gameScore = 0
    
    //Int variable to store the overall high score
    var highScore = 0
    
    //Variable to store the tapped button's title label
    var imageLabel: UILabel?
    
    

    //Create a Game variable
    private var currentGame: Game!
    
    //Function to be called when a new round of the game should be started.
    func newRound() {
        //Enable image buttons
        enableImageButtons(true)
        
        //User's score reset to 0.
        gameScore = 0
        
        //Initialize game variable with gameScore and the words to be used.
        currentGame = Game(currentScore: gameScore, listOfWords: wordList)
        
        //Shuffle words
        currentGame.listOfWords = currentGame.shuffle(stringArray: wordList)
        
        //Reset score label text
        currentScoreLabel.text = "Score: "
        
        //Display first word to user
        currentWordLabel.text = currentGame.listOfWords.removeFirst()
        
       
    }
    
    //Checks if the current game's list of words is empty.
    //If no, it changes the word displayed on the screen to the next one.
    //If yes, it disables image buttons, and shows a 'game over' screen with the user's current score and the high score.
    private func updateGameState() {
        if !currentGame.listOfWords.isEmpty{
                currentWordLabel.text = currentGame.listOfWords.removeFirst()
        } else{
            enableImageButtons(false)
            currentWordLabel.text = "Game over"
            currentScoreLabel.text = "You scored \(currentGame.currentScore) out of 10!"
            updateHighScore()
        }
    }
    
    //Updates the high score if the user's score at the end of the round is bigger than the current high score.
    func updateHighScore(){
        if currentGame.currentScore > highScore {
            highScore = currentGame.currentScore
            highScoreLabel.text = "High Score: \(highScore)"
        }
       
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Begin a new round of the game when the app starts.
        newRound()
        
       //Set content mode of the buttons with images to AspectFit so they don't stretch.
        for i in 0..<(imageButtons.count) {
            imageButtons[i].imageView!.contentMode = UIViewContentMode.scaleAspectFit
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   //Function to be used to enable/disable image buttons.
    private func enableImageButtons(_ enable: Bool) {
        for i in 0..<(imageButtons.count) {
            imageButtons[i].isEnabled = enable
        }
    }
    
    
    //Function to be called when any of the buttons with images are tapped.
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        //Sets the value of imageLabel to be the current button's title label.
        imageLabel = sender.titleLabel
        
        //If the current button's title and the current word are the same,
        //update the currentScore,
        //update the scoreLabel text,
        //and update the game's current state of play.
        if imageLabel?.text == currentWordLabel.text {
            currentGame.currentScore += 1
            currentScoreLabel.text = "Score: \(currentGame.currentScore)"
        }
        updateGameState()
    }
    
    //Function to be called when the New Round button is tapped.
    @IBAction func newRoundTapped(_ sender: UIButton) {
        newRound()
    }
    
        
    


}

