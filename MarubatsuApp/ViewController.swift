//
//  ViewController.swift
//  MarubatsuApp
//
//  Created by 寳門海 on 2022/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    // 表示中の問題番号を格納
    var currentQuestionNum:Int = 0
    
    // 問題
       var questions: [[String: Any]] = [
           [
               "question": "Mr.Childrenのデビュー曲は「innocent world」である",
               "answer": false
           ],
           [
               "question": "桜井和寿さんは、身長は172cm,血液型O型,好きなスポーツはサッカーである",
               "answer": true
           ],
           [
               "question": "Mr.Childrenは2022年をもってデビュー30周年を迎えた",
               "answer": true
           ]
       ]
    
    
    // 問題を表示する関数
      func showQuestion() {
          let question = questions[currentQuestionNum]

          if let que = question["question"] as? String {
              questionLabel.text = que
          }
      }
    
    // 回答をチェックする関数
    // 正解なら次の問題を表示します
    func checkAnswer(yourAnswer: Bool) {

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
        // 問題を表示します。
        // 正解であれば次の問題が、不正解であれば同じ問題が再表示されます。
        showQuestion()
    }
    func showAlert(message: String) {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
            alert.addAction(close)
            present(alert, animated: true, completion: nil)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let userDefaults = UserDefaults.standard
        var newquestion = userDefaults.object(forKey: "addqustion") as? String
        var newselection = userDefaults.object(forKey: "addselection") as? Bool
        questions.append(["question": newquestion,"answer": newselection])
        showQuestion()
    }

    @IBAction func tappedNoButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: false)
    }
    
    @IBAction func tappedYesButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: true)
    }
}
