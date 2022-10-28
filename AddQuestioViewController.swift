//
//  AddQuestioViewController.swift
//  MarubatsuApp
//
//  Created by 寳門海 on 2022/10/23.
//

import UIKit

class AddQuestioViewController: UIViewController {
    
    var questions2 : [[String:Any]] = []
    var judgementsegmentedControl = false
    let userDefaults = UserDefaults.standard
//    var questions:[[String: Any]]
    
    
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
        if let textFieldString = questionTextField.text{
            questions2.append(["question": judgementsegmentedControl, "answer": textFieldString])
            let userDefaults = UserDefaults.standard
            userDefaults.set(questions2, forKey: "NewQuestion")
            showAlert(message: "問題文が追加されました")
            questionTextField.text = ""
        }
        
        
//        if textFieldString != ""{
//
//            questions2.append(["question": judgementsegmentedControl, "answer": textFieldString])
//            let userDefaults = UserDefaults.standard
//            userDefaults.set(questions2, forKey: "NewQuestion")
//            showAlert(message: "問題文が追加されました")
//            questionTextField.text = ""
        else{
            showAlert(message: "問題文が入力されてません")
        }
//        if textFieldString != ""{
//
//            userDefaults.set(textFieldString,forKey: "addqustion")
//            userDefaults.set(judgementsegmentedControl,forKey: "addselection")
//            print(textFieldString)
//            print(judgementsegmentedControl)
//            questionTextField.text = ""
//        }else{
//            showAlert(message: "問題文が入力されてません")
        }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func showAlert(message: String) {

        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
//        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
            alert.addAction(close)
            present(alert, animated: true, completion: nil)
        }
    
   @IBAction func deleteBtn(_ sender: Any) {
       let userDefaults = UserDefaults.standard
       userDefaults.removeObject(forKey: "NewQuestion")
       showAlert(message: "削除しました")
  }
    

    }
