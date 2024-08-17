//
//  ViewController.swift
//  Test3
//
//  Created by Finartz on 18.07.2024.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var btnLogin: UIButton!
    @IBOutlet var txtfldHeight: UITextField!
    @IBOutlet var txtfldWeight: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1 viewdidload called")
        // Do any additional setup after loading the view.
        btnLogin.setTitle("Hesapla", for: .normal)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("2 viewWillAppear Called")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("3 viewDidAppear Called")
    }
    
    func checkIfEnteredHeightValueIsDouble() -> Bool{
        if (txtfldHeight.text == nil) {
            return false
        }
        else {
            return Double(txtfldHeight.text!) is Double
        }
        
    }
    func checkIfEnteredWeightValueIsDouble() -> Bool{
        if (txtfldWeight.text == nil) {
            return false
        }
        else {
            return Double(txtfldWeight.text!) is Double
        }
    }
    func getValueFromHeightTextField() -> Double? {
        if (checkIfEnteredHeightValueIsDouble()) {
            return Double(txtfldHeight.text ?? "0.0") ?? 0.0
        }
        else {
            print("Please enter valid number")
            return nil
        }
    }
    
    func getValueFromWeightTextField() -> Double? {
        if (checkIfEnteredWeightValueIsDouble()) {
            return Double(txtfldWeight.text ?? "0.0") ?? 0.0
        }
        else {
            print("Please enter valid number")
            return nil
        }
    }
    @IBAction func actionCalculate(){
        var heightValue: Double
        var weightValue: Double
        let alert = UIAlertController(title: "Something Went Wrong", message: "Please enter valid double values in the fields", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alert.addAction(okAction)
        let successAlert = UIAlertController(title: "Here is your BMI", message: "Please enter valid double values in the fields", preferredStyle: .alert)
        let successOkAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        successAlert.addAction(successOkAction)
        
        if let heightText = txtfldHeight.text, !heightText.isEmpty, let heightVal = Double(heightText) {
            print("Height is:  \(heightVal)")
            heightValue = heightVal
        }
        else {
            print("Height value is not double")
            heightValue = 0.0
            present(alert, animated: true, completion: nil)
        }
        if let weightText = txtfldWeight.text, !weightText.isEmpty, let weightVal = Double(weightText) {
            print("Weight is: \(weightVal)")
            weightValue = weightVal
        }
        else {
            print ("Weight value is not double")
            weightValue = 0.0
        }
        if (weightValue != 0.0 && heightValue != 0.0 ) {
            let bmi = weightValue / pow(heightValue, 2)
            
            var message: String
            if bmi < 18.5 {
                message = "Underweight, you need to gain some weight."
            }
            else if bmi < 25 {
                message = "Normal Weight, you stay where u are"
            }
            else if bmi < 30 {
                message = "Overweight, not bad but losing a couple pounds would be good"
            }
            else {
                message = "Obese, you need to lose weight fast!"
            }
            successAlert.message = "Your BMI: " + String(format: "%.2f", bmi) + " Your score is \(message) "
            present(successAlert, animated: true)
        }
        
    }

}

