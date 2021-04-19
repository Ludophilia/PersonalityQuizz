//
//  IntroductionViewController.swift
//  PersonalityQuizz
//
//  Created by Jeffrey on 08/04/2021.
//

import UIKit

class IntroductionViewController: UIViewController {

    @IBOutlet var titleStack: UIStackView!
    @IBOutlet var goButton: UIButton!
    @IBOutlet var whichLabel: UIStackView!
    @IBOutlet var animalLabel: UIStackView!
    @IBOutlet var areLabel: UIStackView!
    @IBOutlet var youLabel: UIStackView!
    @IBOutlet var questionLabel: UIStackView!
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundCorners()
    }
    
    func roundCorners() {
//        titleStack.layer.cornerRadius = CGFloat(30)
        goButton.layer.cornerRadius = CGFloat(15)
//        whichLabel.layer.cornerRadius = CGFloat(15)
//        animalLabel.layer.cornerRadius = CGFloat(15)
//        areLabel.layer.cornerRadius = CGFloat(15)
//        youLabel.layer.cornerRadius = CGFloat(15)
//        questionLabel.layer.cornerRadius = CGFloat(10)
    }
    // Next step, Animate the background with animal emojis falling...
}

