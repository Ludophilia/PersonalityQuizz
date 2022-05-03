//
//  IntroductionViewController.swift
//  PersonalityQuizz
//
//  Created by Jeffrey on 08/04/2021.
//

import UIKit

class IntroductionViewController: UIViewController {

    // Why not try one day to animate the background with animal emojis falling...?

    // MARK: UI Components
    
    @IBOutlet var goButton: UIButton!
    
    // MARK: Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundCorners()
    }
    
    func roundCorners() {
        goButton.layer.cornerRadius = CGFloat(15)
    }
}

