//
//  QuestionViewController.swift
//  PersonalityQuizz
//
//  Created by Jeffrey on 10/04/2021.
//

import UIKit

class QuestionViewController: UIViewController {

    // MARK: UI Components
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var questionNumber: UILabel!
    @IBOutlet var testProgressView: UIProgressView!
    
    @IBOutlet var singleChoiceStack: UIStackView!
    @IBOutlet var singleChoiceButtons: [UIButton]!

    @IBOutlet var rangedChoiceStack: UIStackView!
    @IBOutlet var rangedChoiceLabels: [UILabel]!
    @IBOutlet var rangedChoiceSlider: UISlider!
    
    @IBOutlet var multipleChoiceStack: UIStackView!
    @IBOutlet var multipleChoiceLabels: [UILabel]!
    @IBOutlet var multipleChoiceSwitches: [UISwitch]!

    @IBOutlet var submitButton: UIButton!
    
    // MARK: Model Data
    
    let questions: [Question] = Question.testQuestions
    var questionIndex = 0
    var currentQuestion: Question { return questions[questionIndex] }
    var questionsAnswered = 0 {
        didSet {
            if (questionsAnswered < (questions.count)) {
                questionIndex += 1
            }
        }
    }
    var answersChosen = [Answer]()
    var currentAnswers: [Answer] { return currentQuestion.answers }
    var totalProgress: Float { Float(questionIndex + 1) / Float(questions.count) }
    
    // MARK: Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundButtonCorners()
        updateUI()
    }
    
    func roundButtonCorners() {
        submitButton.layer.cornerRadius = CGFloat(15)
        for button in singleChoiceButtons {
            button.layer.cornerRadius = CGFloat(15)
        }
    }
    
    // MARK: UI Refresh
    
    func updateUI() {
        singleChoiceStack.isHidden = true
        rangedChoiceStack.isHidden = true
        multipleChoiceStack.isHidden = true
        submitButton.isHidden = true
        
        questionLabel.text = currentQuestion.text
        questionNumber.text = String(format: "%02d", arguments: [questionIndex+1])
        testProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleChoiceStack.isHidden = false
        for id in 0...3 {
            singleChoiceButtons[id].setTitle(answers[id].text, for: .normal)
        }
    }
    func updateMultipleStack(using answers: [Answer]) {
        multipleChoiceStack.isHidden = false
        submitButton.isHidden = false
        for id in 0...3 {
            multipleChoiceLabels[id].text = answers[id].text
            multipleChoiceSwitches[id].isOn = false
        }
    }
    func updateRangedStack(using answers: [Answer]) {
        rangedChoiceStack.isHidden = false
        submitButton.isHidden = false
        rangedChoiceSlider.setValue(0.5, animated: false)
        for label in rangedChoiceLabels {
            label.text = (label == rangedChoiceLabels.first!) ? answers.first?.text : answers.last?.text
        }
    }
    
    // MARK: UI Actions Logic
    
    @IBAction func singleChoiceButtonPressed(_ sender: UIButton) {
        answersChosen += [currentAnswers[sender.tag]]
        nextQuestion()
    }
    
    @IBAction func validateRangedOrMultipleChoice() {
        if !multipleChoiceStack.isHidden {
            for toggle in multipleChoiceSwitches {
                if toggle.isOn {
                    answersChosen += [currentAnswers[toggle.tag]]
                }
            }
        } else if !rangedChoiceStack.isHidden {
            let rangeIndex = Int(rangedChoiceSlider.value * (Float(currentAnswers.count) - 0.01))
            answersChosen += [currentAnswers[rangeIndex]]
        }
        nextQuestion()
    }
    
    func nextQuestion() {
        questionsAnswered += 1
        if questionsAnswered < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultSegue", sender: nil)
        }
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = answersChosen
        }
    }
    
    @IBAction func unwindToQuestionViewController(segue: UIStoryboardSegue) {
        questionsAnswered = 0
        questionIndex = 0
        answersChosen = [Answer]()
        updateUI()
    }
        

}
