//
//  ResultsViewController.swift
//  PersonalityQuizz
//
//  Created by Jeffrey on 10/04/2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: UI Components

    @IBOutlet var restartButton: UIButton!
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    // MARK: Model Data

    var responses: [Answer]!
    
    // MARK: Setup

    override func viewDidLoad() {
        super.viewDidLoad()
        roundButtonCorners()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    
    func roundButtonCorners() {
        restartButton.layer.cornerRadius = CGFloat(15)
    }
    
    // MARK: Logic
    
    func calculatePersonalityResult() {
        let responseTypes = responses.map { $0.type }
        var frequencyOfAnswers = [AnimalType: Int]()
        
        for type in responseTypes { frequencyOfAnswers[type, default: 0] += 1 }
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key

        resultAnswerLabel.text = "\(mostCommonAnswer.rawValue)"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
    
}
