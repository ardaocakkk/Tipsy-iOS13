//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Arda Ocak on 26.11.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    var numberOfPeople: Int = 0
    var tipPercentage: Double? = 0.0
    var total: Double? = 0.0
    var billPerPerson: Double? = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = String(billPerPerson!)
        settingsLabel.text = "\(numberOfPeople) people, \(tipPercentage!)% tip"
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func recalculatePressed(_ sender: UIButton) {
    }
}
