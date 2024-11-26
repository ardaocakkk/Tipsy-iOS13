//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Arda Ocak on 26.11.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    var button : UIButton!
    var totalBill: Double! = 0
    var splittedTotalBill: Double! = 0
    var numberOfPeople : Int! = 2
    var tipPercentage: Double! = 0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        var selectedButton = selectButton(sender)
        billTextField.endEditing(true)
    }
    
    func selectButton(_ selectedButton: UIButton) -> UIButton {
        let buttons = [zeroPctButton, tenPctButton, twentyPctButton]
        for button in buttons {
            button?.isSelected = false
        }
        selectedButton.isSelected = true
        button = selectedButton
        return selectedButton
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(sender.value)"
        numberOfPeople = Int(sender.value)
        

    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let converter = NumberFormatter()
        converter.locale = Locale.current
        if button.isEqual(zeroPctButton) {
            print(0)
            tipPercentage = 0
            totalBill = Double(truncating: converter.number(from: billTextField.text!) ?? 0.0)

        }
        else if button.isEqual(tenPctButton) {
            print(0.1)
            totalBill = (Double(truncating: converter.number(from: billTextField.text!) ?? 0.0))

        }else if button.isEqual(twentyPctButton) {
            tipPercentage = 0.2
            totalBill = (1.2 * Double(truncating: converter.number(from: billTextField.text!) ?? 0.0))
        }
        
        splittedTotalBill = totalBill / Double(splitNumberLabel.text!)!
        print(NSString(format: "%.2f", splittedTotalBill))
        performSegue(withIdentifier: String("goToResult"), sender: nil) // segue çalışması için gerekli metod


    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToResult"{
        let destinationVC = segue.destination as! ResultsViewController
        destinationVC.numberOfPeople = numberOfPeople
        destinationVC.tipPercentage = tipPercentage
        destinationVC.total = totalBill
        destinationVC.billPerPerson = splittedTotalBill
    }}
    

}
