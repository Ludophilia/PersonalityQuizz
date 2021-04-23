//
//  ResultsViewController.swift
//  PersonalityQuizz
//
//  Created by Jeffrey on 10/04/2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var restartButton: UIButton!
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundButtonCorners()
        calculatePersonalityResult()
    }
    
    func calculatePersonalityResult() {
        let responseTypes = responses.map { $0.type }
        var frequencyOfAnswers = [AnimalType: Int]()
        for type in responseTypes { frequencyOfAnswers[type, default: 0] += 1 }
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultAnswerLabel.text = "\(mostCommonAnswer.rawValue)"
        resultDefinitionLabel.text = mostCommonAnswer.definition
        print(responseTypes)
    }
    
    func roundButtonCorners() {
        restartButton.layer.cornerRadius = CGFloat(15)
    }

}
