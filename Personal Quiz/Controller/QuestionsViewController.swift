//
//  QuestionsViewController.swift
//  Personal Quiz
//
//  Created by Sergey Zakurakin on 01/02/2024.
//

import UIKit

class QuestionsViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    
    @IBOutlet weak var multiplyStackView: UIStackView!
    @IBOutlet var multiplyLabels: [UILabel]!
    @IBOutlet var multiplySwitchs: [UISwitch]!
    
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet weak var rangedSlider: UISlider!
    
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    
    // MARK: - Private propertis
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var answersChoosen: [Answer] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        updateUI()
    }
    

  

    // MARK: - IBActions
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        guard let currentIndex = singleButtons.firstIndex(of: sender) else {return}
        let currentAnswer = currentAnswers[currentIndex]
        answersChoosen.append(currentAnswer)
        
        nextQuestion()
        
    }
    
    
    @IBAction func multiplyAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        for (multiplySwitch, answer) in zip(multiplySwitchs, currentAnswers) {
            if multiplySwitch.isOn {
                answersChoosen.append(answer)
            }
        }
        
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChoosen.append(currentAnswers[index])
        
        nextQuestion()
        
    }
    
    
    
    
    
    
    // MARK: - Private Methods
    
    // update user interface
    private func updateUI() {
        // hide everithing
        singleStackView.isHidden = true
        multiplyStackView.isHidden = true
        rangedStackView.isHidden = true
        
        // Get current question
        let currentQuestion = questions[questionIndex]
        
        // Set current question for question label
        questionLabel.text = currentQuestion.text
        
        
        // calculate progress
        let totalprogress = Float(questionIndex) / Float(questions.count)
        
        // set progress for questionProgress View
        questionProgressView.setProgress(totalprogress, animated: true)
        
        
        // set navigation title
        title = "Question \(questionIndex + 1) from \(questions.count)"
        
        
        let currentAnswers = currentQuestion.answers
        
        // show stackView corresponding to question type
        switch currentQuestion.type {
        case .single:
            updateSingleStackView(using: currentAnswers)
        case .multyple:
            updateMultiplyStackView(using: currentAnswers)
        case .ranged:
            updateRangedStackView(using: currentAnswers)
        }
    }
    /// Setup Singel stackView
    /// - Parameter answers: array with answers
    ///
    ///  Description of methods
    private func updateSingleStackView(using answers: [Answer]) {
        // show single stackView
        singleStackView.isHidden = false
        
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    private func updateMultiplyStackView(using answers: [Answer]) {
        // show single stackView
        multiplyStackView.isHidden = false
        
        for (label, answer) in zip(multiplyLabels, answers){
            label.text = answer.text
        }
        
    }
        
    private func updateRangedStackView(using answers: [Answer]) {
        // show single stackView
        rangedStackView.isHidden = false
        
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
    
    
    // MARK - Navigation
    
    // show next question or go to the next screen
    private func nextQuestion() {
        // TODO: Implement the function
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
        
    }
    
    // prepare third Viewcontrolle method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "resultSegue" else { return }
        let resultVC = segue.destination as! ResultsViewController
        resultVC.responses = answersChoosen
    }
    
}
