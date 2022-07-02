//
// ViewController.swift
// Demo
// 
// Created by DreamOnline on 7/1/22.
// Copyright © 2019 DreamOnline. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func initializeUI () {
        self.inputField.delegate = self
        self.inputField.textColor = .black
        self.resultLabel.textColor = .black
        self.resultLabel.isHidden = true
    }

    @IBAction func calculateResult(_ sender: UIButton) {
        guard let val = inputField.text else {
            return
        }
        if val.isEmpty == true || val.count != 4 {
            self.showAlert()
        } else {
            let result = self.isLeapYear(Int(val)!)
            self.resultLabel.isHidden = false
            if result {
                self.resultLabel.text = "\(val) is a leap year"
            } else {
                self.resultLabel.text = "\(val) is not a leap year"
            }
        }
    }

    func showAlert () {
        let alert = UIAlertController(title: "Leap Year", message: "Please input valid year", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
                case .default:
                print("default")

                case .cancel:
                print("cancel")

                case .destructive:
                print("destructive")

            @unknown default:
                break

            }
        }))
        self.present(alert, animated: true, completion: nil)
    }

    func isLeapYear(_ year: Int) -> Bool {
        let isLeapYear = ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0))
        return isLeapYear
    }
}

extension ViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {    //delegate method

    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {  //delegate method
        return false
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let isNumber = CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: string))
        let withDecimal = (
            string == NumberFormatter().decimalSeparator &&
            textField.text?.contains(string) == false
        )
        return isNumber || withDecimal
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
      textField.resignFirstResponder()
        return true
    }
}
