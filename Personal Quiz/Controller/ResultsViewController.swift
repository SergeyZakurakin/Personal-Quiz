//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by Sergey Zakurakin on 01/02/2024.
//

import UIKit

class ResultsViewController: UIViewController {
    
// MARK: - IB Outlets
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    // MARK: - Public properties
    
    
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateResults()
        navigationItem.hidesBackButton = true
    }

    
    private func updateResults() {
        var frequencyOfAnimals: [AnimalType: Int] = [:]
        let animals = responses.map { $0.type }
        
        for animal in animals {
            frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
        }
        
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted {$0.value > $1.value}
        
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequencyAnimal)
    }
    
    private func updateUI(with animal: AnimalType) {
        resultAnswerLabel.text = "ВЫ - \(animal.rawValue)"
        resultDefinitionLabel.text = "\(animal.definition)"
    }
    
}
