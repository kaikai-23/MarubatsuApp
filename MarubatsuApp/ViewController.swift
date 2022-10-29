//
//  ViewController.swift
//  MarubatsuApp
//
//  Created by 寳門海 on 2022/10/22.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var questionLabel: UILabel!
    let userDefaults = UserDefaults.standard
    // 表示中の問題番号を格納
    var currentQuestionNum:Int = 0
    var questions: [[String: Any]] = []
    
   
    // 問題を表示する関数
    func showQuestion() {
        if questions.isEmpty == true{
            questionLabel.text = "問題がありません。問題を作りましょう"
        }else{
            let question = questions[currentQuestionNum]
            if let que = question["question"] as? String {
                questionLabel.text = que
                }
            }
        }
    // 回答をチェックする関数
    // 正解なら次の問題を表示します
    func checkAnswer(yourAnswer: Bool) {
        
        switch questions.isEmpty {
        case  true: questionLabel.text = "問題がありません。問題を作りましょう"
        case false:
            let question = questions[currentQuestionNum]
            if let ans = question["answer"] as? Bool {
                
                if yourAnswer == ans {
                    // 正解
                    showAlert(message: "正解！")
                    
                    
                    // currentQuestionNumを1足して次の問題に進む
                    currentQuestionNum += 1
                } else {
                    // 不正解
                    showAlert(message: "不正解...")
                    
                }
            } else {
                print("答えが入ってません")
                return
            }
            
            
            if currentQuestionNum >= questions.count {
                currentQuestionNum = 0
            }
            showQuestion()
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message,
             preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
            alert.addAction(close)
            present(alert, animated: true, completion: nil)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //showQuestion()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        if userDefaults.array(forKey: "NewQuestion") != nil {
            questions = userDefaults.array(forKey: "NewQuestion") as! [[String:Any]]
            showQuestion()
        }else{
            questions = []
            questionLabel.text = "問題がありません。問題を作りましょう"
        }

    }

    @IBAction func tappedNoButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: false)
    }
    
    @IBAction func tappedYesButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: true)
    }
    
}
