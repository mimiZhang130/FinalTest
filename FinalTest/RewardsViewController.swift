//
//  RewardsViewController.swift
//  FinalTest
//
//  Created by Mimi Zhang on 7/30/20.
//  Copyright © 2020 Mimi Zhang. All rights reserved.
//

import UIKit

class RewardsViewController: UIViewController {
    var previousVC = ViewController()
    var pointTotal = Int() // pointTotal displayed
    
    @IBOutlet weak var totalCoins: UILabel!
    @IBOutlet weak var numOfCoins: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let yay = getTotalPoints()
        print("pointTotal \(yay)")
        // Do any additional setup after loading the view.
        numOfCoins.text = String(previousVC.addPoints.points)
        totalCoins.text = String(getTotalPoints())
        
    }
    func getTotalPoints() -> Int{
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataPoints = try? context.fetch(PointSystem.fetchRequest()) as? Int{
                    print("core data point \(coreDataPoints)")
                    pointTotal = Int(coreDataPoints)
            }
        }
        return pointTotal
    }
    
    

    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
       if let addVC = segue.destination as? ViewController {
                    addVC.nextVC = self
                }
    }
     */
    

}
