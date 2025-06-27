//
//  ViewController.swift
//  Trivia
//
//  Created by Huynh Huyen on 6/26/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var questionContent: UILabel!

    @IBOutlet weak var optionOneButton: UIButton!
    @IBOutlet weak var optionTwoButton: UIButton!
    @IBOutlet weak var optionThreeButton: UIButton!
    @IBOutlet weak var optionFourButton: UIButton!
    
    var questions: [TriviaInfo] = []
    var currentQuestion: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()
        displayQuestion()
        // Do any additional setup after loading the view.
    }
    
    func loadQuestion(){
        questions = [
            TriviaInfo(questionContent: "What is the capitol of Texas?",
                topic: "Geography",
                options: ["Houston", "Austin", "Dallas", "Sanantonio"],
                correctAnswerIndex: 1),
            TriviaInfo(questionContent: "When did Texas become a state of The United States of America?",
                topic: "History",
                options: ["1844", "1843", "1840", "1845"],
                correctAnswerIndex: 3),
            TriviaInfo(questionContent: "What style of music is Texas known for influencing?",
                topic: "Music",
                options: ["Pop", "Country Music", "Rock", "Jazz"],
                correctAnswerIndex: 1),
            TriviaInfo(questionContent: "What is the most popular sport in Texas?",
                topic: "Sports",
                options: ["Soccer", "Basketball", "Football", "Swimming"],
                correctAnswerIndex: 2)
            
                ]
    }
    
    func displayQuestion(){
        let question = questions[currentQuestion]
        questionLabel.text = "Question: \(currentQuestion + 1)/\(questions.count)"
        topicLabel.text = question.topic
        questionContent.text = question.questionContent
        optionOneButton.setTitle(question.options[0], for: .normal)
        optionTwoButton.setTitle(question.options[1], for: .normal)
        optionThreeButton.setTitle(question.options[2], for: .normal)
        optionFourButton.setTitle(question.options[3], for: .normal)


    }
    
    
    var score = 0
    @IBAction func didTapButton(_ sender: UIButton) {
        
        let current = questions[currentQuestion]
        if sender.currentTitle == current.options[current.correctAnswerIndex]{
            score += 1
        }
       currentQuestion += 1
        if currentQuestion < questions.count {
            displayQuestion()
        } else {
            //show the final result
            displayFinalResult()
        }
    }
    
    func displayFinalResult(){
        let alertController = UIAlertController(title: "Game Over", message: "Final Score: \(score)/\(questions.count)", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in self.restartGame()}))
        
        present(alertController, animated: true)

    }
    
    func restartGame(){
        score = 0
        currentQuestion = 0
        displayQuestion()
    }
    
}
