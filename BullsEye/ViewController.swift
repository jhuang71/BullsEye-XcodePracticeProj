//
//  ViewController.swift
//  BullsEye
//
//  Created by Jay Huang on 11/2/18.
//  Copyright © 2018 Jay Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    
    //testing git command line
    var currentVal = 0
    var currentScore = 0
    var currentRound = 1
    var randomTarget = Int.random(in: 1...100)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set current value of the slider when the app start
        let roundedVal = slider.value.rounded()
        currentVal = Int(roundedVal)
    
        scoreLabel.text = String(currentScore)
        roundLabel.text = String(currentRound)
        targetLabel.text = String(randomTarget)

    }
    
    
    
    @IBAction func showAlert(){
        // instanitate the alert box by giving it properties
        let message = "You scored \(calScore()) points!!"
        let alert = UIAlertController(title: "Nice Job!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        // adding the button to the alert box after hitting "Hit Me"
        // making it present by calling present function
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNextRound()
        
        
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedVal = slider.value.rounded()
        print("The value of the slider is: \(roundedVal)")
        currentVal = Int(roundedVal)
        
    }
    
    @IBAction func reset(){
        currentRound = 1
        currentScore = 0
        
        slider.value = 50
        scoreLabel.text = String(currentScore)
        roundLabel.text = String(currentRound)
        
        randomTarget = Int.random(in: 1...100)
        targetLabel.text = String(randomTarget)
        
    }
    
    func title() -> String{
        if(calScore() == 0){
            return "Perfect!"
        }
        else if(calScore() < 5){
            return "You almost had it!"
        }
        else if(calScore() < 10){
            return "Not too bad!"
        }else{
            return "Not even close!"
        }
    }
    
    func startNextRound(){
        incRoundAndScore()
        roundLabel.text = String(currentRound)
        scoreLabel.text = String(currentScore)
        randomTarget = Int.random(in: 1...100)
        targetLabel.text = String(randomTarget)
    }
    
    func incRoundAndScore(){
        currentRound += 1
        currentScore += calScore()
    }
    
    
    // () -> returnType
    func calScore() -> Int{
        let diff = abs(randomTarget - currentVal)
        
        let score = 100 - diff
        return score
    }
    
}

