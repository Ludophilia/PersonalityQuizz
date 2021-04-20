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
    @IBOutlet var testProgress: UIProgressView!
    
    @IBOutlet var singleChoiceAnswer: UIStackView!
    @IBOutlet var singleChoice1: UIButton!
    @IBOutlet var singleChoice2: UIButton!
    @IBOutlet var singleChoice3: UIButton!
    @IBOutlet var singleChoice4: UIButton!
    @IBOutlet var singleChoices: [UIButton]! // For testing purposes
    
    @IBOutlet var rangedChoiceAnswer: UIStackView!
    @IBOutlet var rangedChoiceLabel1: UILabel!
    @IBOutlet var rangedChoiceLabel2: UILabel!
    @IBOutlet var submitButton: UIButton!

    @IBOutlet var multipleChoiceAnswer: UIStackView!
    @IBOutlet var multipleChoiceLabel1: UILabel!
    @IBOutlet var multipleChoiceLabel2: UILabel!
    @IBOutlet var multipleChoiceLabel3: UILabel!
    @IBOutlet var multipleChoiceLabel4: UILabel!
    @IBOutlet var multipleChoiceLabels: [UILabel]! // For testing purposes
    
    var questionIndex = 0
    var questions: [Question] = [
        Question(text: "Which food do you like the most?",
                 type: .single,
                 answers: [
                    Answer(text: "Steak", type: .dog),
                    Answer(text: "Fish", type: .cat),
                    Answer(text: "Carrots", type: .rabbit),
                    Answer(text: "Corn", type: .turtle)
                 ]
        ),
        Question(text: "Which activities do you enjoy?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Swimming", type: .turtle),
                    Answer(text: "Sleeping", type: .cat),
                    Answer(text: "Cuddling", type: .rabbit),
                    Answer(text: "Eating", type: .dog)
                 ]
        ),
        Question(text: "How much do you enjoy car rides?",
                 type: .ranged,
                 answers: [
                    Answer(text: "I dislike them", type: .cat),
                    Answer(text: "I get a little nervous", type: .rabbit),
                    Answer(text: "I barely notice them", type: .turtle),
                    Answer(text: "I love them", type: .dog)
                 ]
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundCorners()
        updateUI()
    }

    func roundCorners() {
        submitButton.layer.cornerRadius = CGFloat(15)
        singleChoice1.layer.cornerRadius = CGFloat(15)
        singleChoice2.layer.cornerRadius = CGFloat(15)
        singleChoice3.layer.cornerRadius = CGFloat(15)
        singleChoice4.layer.cornerRadius = CGFloat(15)
    }
    
    func updateUI() {
        singleChoiceAnswer.isHidden = true
        rangedChoiceAnswer.isHidden = true
        multipleChoiceAnswer.isHidden = true
        submitButton.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex+1)/Float(questions.count)
        
        questionLabel.text = currentQuestion.text
        questionNumber.text = String(format: "%02d", arguments: [questionIndex+1])
        testProgress.setProgress(totalProgress, animated: true)
        
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
        singleChoiceAnswer.isHidden = false
        for id in 0...3 {
            singleChoices[id].setTitle(answers[id].text, for: .normal)
        }
    }
    func updateMultipleStack(using answers: [Answer]) {
        multipleChoiceAnswer.isHidden = false
        submitButton.isHidden = false
        for id in 0...3 {
            multipleChoiceLabels[id].text = answers[id].text
        }
    }
    func updateRangedStack(using answers: [Answer]) {
        rangedChoiceAnswer.isHidden = false
        submitButton.isHidden = false
        rangedChoiceLabel1.text = answers.first?.text
        rangedChoiceLabel2.text = answers.last?.text
    }
}
