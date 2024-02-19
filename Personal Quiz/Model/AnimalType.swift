//
//  AnimalType.swift
//  Personal Quiz
//
//  Created by Sergey Zakurakin on 30/01/2024.
//

import Foundation


enum AnimalType: String {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    
    var definition: String {
        switch self {
        case .dog:
            return "тут должно быть описание что вам нравиться если вы Dog"
        case .cat:
            return "тут должно быть описание что вам нравиться если вы Cat"
        case .rabbit:
            return "тут должно быть описание что вам нравиться если вы Rabbit"
        case .turtle:
            return "тут должно быть описание что вам нравиться если вы Turtle"
        }
    }
}
