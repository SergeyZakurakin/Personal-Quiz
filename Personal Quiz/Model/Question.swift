//
//  Question.swift
//  Personal Quiz
//
//  Created by Sergey Zakurakin on 30/01/2024.
//

import Foundation



struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}




extension Question {
    static func getQuestions() -> [Question] {
        return [
            Question(text: "What food do you like?",
                     type: .single,
                     answers: [
                        Answer(text: "Meet", type: .dog),
                        Answer(text: "Fish", type: .cat),
                        Answer(text: "carret", type: .rabbit),
                        Answer(text: "corn", type: .turtle)
            ]),
            Question(text: "What do you like more?",
                     type: .multyple,
                     answers: [
                        Answer(text: "Swim", type: .dog),
                        Answer(text: "Sleep", type: .cat),
                        Answer(text: "Hugs", type: .rabbit),
                        Answer(text: "Eat", type: .turtle)
            ]),
            Question(text: "Do you like traveling?",
                     type: .ranged,
                     answers: [
                        Answer(text: "Don't like", type: .dog),
                        Answer(text: "Not", type: .cat),
                        Answer(text: "Yes", type: .rabbit),
                        Answer(text: "Very like", type: .turtle)
            ])
        ]
    }
}
