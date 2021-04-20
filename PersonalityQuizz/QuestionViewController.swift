//
//  QuestionViewController.swift
//  PersonalityQuizz
//
//  Created by Jeffrey on 10/04/2021.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var questionNumber: UILabel!
    @IBOutlet var testProgressView: UIProgressView!
    
    @IBOutlet var singleChoiceStack: UIStackView!
    @IBOutlet var rangedChoiceStack: UIStackView!
    @IBOutlet var multipleChoiceStack: UIStackView!

    @IBOutlet var singleChoiceButtons: [UIButton]!
    @IBOutlet var multipleChoiceLabels: [UILabel]!
    @IBOutlet var rangedChoiceLabels: [UILabel]!
    
    @IBOutlet var submitButton: UIButton!

    var questionIndex = 0
    var questions: [Question] = testQuestions
    var answersChosen = [Answer]()
    
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
    
    func updateUI() {
        singleChoiceStack.isHidden = true
        rangedChoiceStack.isHidden = true
        multipleChoiceStack.isHidden = true
        submitButton.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex+1)/Float(questions.count)
        
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
        }
    }
    func updateRangedStack(using answers: [Answer]) {
        rangedChoiceStack.isHidden = false
        submitButton.isHidden = false
        for label in rangedChoiceLabels {
            let isFirst = label == rangedChoiceLabels.first!
            label.text = isFirst ? answers.first?.text : answers.last?.text
        }
    }
}
