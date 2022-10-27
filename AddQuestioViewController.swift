//
//  AddQuestioViewController.swift
//  MarubatsuApp
//
//  Created by 寳門海 on 2022/10/23.
//

import UIKit

class AddQuestioViewController: UIViewController {

    var textFieldString:String?
    var judgementsegmentedControl = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func judgementSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            judgementsegmentedControl = false
        case 1:
            judgementsegmentedControl = true
        default :print("エラー")
        }
    
        
    }
    
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBAction func saveBtn(_ sender: Any) {
        textFieldString = questionTextField.text
        let userDefaults = UserDefaults.standard
        userDefaults.set(textFieldString,forKey: "addqustion")
        userDefaults.set(judgementsegmentedControl,forKey: "addselection")
        questionTextField.text = ""
        


        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
