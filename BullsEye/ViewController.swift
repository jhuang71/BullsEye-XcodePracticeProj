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
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var round: UILabel!
    @IBOutlet weak var target: UILabel!
    
    var currentVal: Int = 0
    var currentScore: Int = 0
    var currentRound: Int = 0
    var randomTarget = arc4random_uniform(101)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set current value of the slider when the app start
        let roundedVal = slider.value.rounded()
        currentVal = Int(roundedVal)
    
        score.text = String(currentScore)
        round.text = String(currentRound)
        target.text = String(randomTarget)
        print(calScore(6))
    }
    
    
    
    @IBAction func showAlert(){
        // instanitate the alert box by giving it properties
        let message = "The value of the slider is: \(currentVal) \n The expected value is: \(randomTarget)"
        let alert = UIAlertController(title: "Hello, World!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        // adding the button to the alert box after hitting "Hit Me"
        // making it present by calling present function
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        updateLabel()
        
        
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedVal = slider.value.rounded()
        print("The value of the slider is: \(roundedVal)")
        currentVal = Int(roundedVal)
        
    }
    
    func updateLabel(){
        incRound()
        round.text = String(currentRound)
        score.text = String(currentScore)
        randomTarget = arc4random_uniform(101)
        target.text = String(randomTarget)
    }
    
    func incRound(){
        currentRound += 1
        // calculate percentage afterward
    }
    
    func reset(){
        currentRound = 0
        currentScore = 0
        
        score.text = String(currentScore)
        round.text = String(currentRound)
        
        randomTarget = arc4random_uniform(101)
        target.text = String(randomTarget)
        
    }
    
    func calScore(_ silderVal: Int) -> Int{
        var int:Int = 2
        int = int * silderVal
        return int
    }
    
}

