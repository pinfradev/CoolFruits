//
//  FruitDetailViewController.swift
//  CoolFruits
//
//  Created by Luis Alejandro Zapata Gonzalez on 19-07-22.
//

import Foundation
import UIKit

public class FruitDetailViewController: UIViewController {
    @IBOutlet weak var familyLabel: UILabel!
    @IBOutlet weak var genusLabel: UILabel!
    @IBOutlet weak var nutritionLabel: UILabel!
    
    var selectedFruit: FruitModel?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        if let selectedFruit = selectedFruit {
            familyLabel.text = "Family: \(selectedFruit.family!)"
            genusLabel.text = "Genus: \(selectedFruit.genus!)"
            nutritionLabel.text = getNutritionText(selectedFruit: selectedFruit)
            
            if selectedFruit.genus == Strings.FruitsList.citrusGenus {
                view.backgroundColor = UIColor.systemGreen
            }
        }
    }
    

    func getNutritionText(selectedFruit: FruitModel) -> String {
        var text = String()
        text += "Sugar: " + String(selectedFruit.nutritions?.sugar ?? 0)
        text += "\n"
        text += "Calories: " + String(selectedFruit.nutritions?.calories ?? 0)
        text += "\n"
        text += "Fat: " + String(selectedFruit.nutritions?.fat ?? 0)
        return text
    }
}
