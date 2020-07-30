//
//  ViewController.swift
//  FinalTest
//
//  Created by Mimi Zhang on 7/30/20.
//  Copyright © 2020 Mimi Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var addPoints = coin()
    var diffLev = Int()
    @IBOutlet weak var goalName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
 
    }
    
    @IBAction func easyButton(_ sender: UIButton) {
        diffLev = 1 //setting the difficulty level

    }
    @IBAction func mediumButton(_ sender: UIButton){
        diffLev = 2 //setting the difficulty level
    }
    @IBAction func hardButton(_ sender: UIButton){
        diffLev = 3 //setting the difficulty level
    }
    //Problem: goal1.points = 0, likely because diff Level is wrong
    @IBAction func addTapped(_ sender: Any){
         addPoints.points = setPoints()
         print(addPoints.points) //for debugging
    }
    func setPoints() -> Int{ // setting up point system
        let goal1 = coin() //goal1 is a new coin object, created everytime
        goal1.goal = goalName.text!
        goal1.numOfCoins = Int.random(in: 1...5)
        goal1.difficultyLevel = diffLev
        goal1.points = goal1.difficultyLevel * goal1.numOfCoins
        return(goal1.points)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get the new view controller using segue.destination.
           // Pass the selected object to the new view controller.
           if let rewardsVC = segue.destination as? RewardsViewController {
               rewardsVC.previousVC = self
           }
           
       }

}

