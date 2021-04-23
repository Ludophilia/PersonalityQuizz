//
//  QuestionData.swift
//  PersonalityQuizz
//
//  Created by Jeffrey on 17/04/2021.
//

import Foundation

let testQuestions = [
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

struct Question {
    var text: String
    var type: AnswerType
    var answers: [Answer]
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnswerType {
    case single, multiple, ranged
}

enum AnimalType: String {
    case dog = "DOG 🐶", cat = "CAT 🐱", rabbit = "RABBIT 🐰", turtle = "TURTLE 🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."
        case .cat:
            return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
        case .rabbit:
            return "You love everything that's soft. You are healthy and full of energy."
        case .turtle:
            return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
        }
    }
}

