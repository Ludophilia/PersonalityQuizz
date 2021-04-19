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
    
    @IBOutlet var rangedChoiceAnswer: UIStackView!
    @IBOutlet var rangedChoiceLabel1: UILabel!
    @IBOutlet var rangedChoiceLabel2: UILabel!
    @IBOutlet var submitButton: UIButton!

    @IBOutlet var multipleChoiceAnswer: UIStackView!
    @IBOutlet var multipleChoiceLabel1: UILabel!
    @IBOutlet var multipleChoiceLabel2: UILabel!
    @IBOutlet var multipleChoiceLabel3: UILabel!
    @IBOutlet var multipleChoiceLabel4: UILabel!
    
    var questionIndex = 0
    var questions: [Question] = [
        Question(text: "Which food do you like the most?",
                 type: .ranged,
                 answers: [
                    Answer(text: "Steak", type: .dog),
                    Answer(text: "Fish", type: .cat),
                    Answer(text: "Carrots", type: .rabbit),
                    Answer(text: "Corn", type: .turtle)
                 ]
        ),
        Question(text: "Which activities do you enjoy",
                 type: .multiple,
                 answers: [
                    Answer(text: "Swimming", type: .turtle),
                    Answer(text: "Sleeping", type: .cat),
                    Answer(text: "Cuddling", type: .rabbit),
                    Answer(text: "Eating", type: .dog)
                 ]
        ),
        Question(text: "How much do you enjoy car rides",
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

        questionNumber.text = String(format: "%02d", arguments: [questionIndex+1])
        
        let currentQuestion = questions[questionIndex]
        let currrentAnswers = currentQuestion.answers
        
        switch currentQuestion.type {
        case .single:
            singleChoiceAnswer.isHidden = false
        case .multiple:
            multipleChoiceAnswer.isHidden = false
            submitButton.isHidden = false
        case .ranged:
            rangedChoiceAnswer.isHidden = false
            submitButton.isHidden = false
        }
    }
}
