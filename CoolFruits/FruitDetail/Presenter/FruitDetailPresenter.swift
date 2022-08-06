//
//  FruitDetailPresenter.swift
//  CoolFruits
//
//  Created by Fray Pineda on 6/8/22.
//

import UIKit

class FruitDetailPresenter: FruitDetailPresenterInput {
    
    weak var view: FruitDetailPresenterOutput?
    var selectedFruit: FruitModel!
    
    init(selectedFruit: FruitModel) {
        self.selectedFruit = selectedFruit
    }
    
    func getFruitInformation() {
        let family = "Family: \(selectedFruit.family ?? "")"
        let genus = "Genus: \(selectedFruit.genus ?? "")"
        let nutrition = getNutritionText(selectedFruit: selectedFruit)
        
        let viewModel = FruitDetailViewModel(
            family: family,
            genus: genus,
            nutrition: nutrition)
        
        view?.didGetFruitInformation(viewModel: viewModel)
    }
    
    func setBackgroundColor() {
        if selectedFruit.genus == Strings.FruitsList.citrusGenus {
            view?.setBackground(color: UIColor.systemGreen)
        }
    }
    
    private func getNutritionText(selectedFruit: FruitModel) -> String {
        var text = String()
        
        text += "Sugar: " + String(selectedFruit.nutritions?.sugar ?? 0)
        text += "\n"
        text += "Calories: " + String(selectedFruit.nutritions?.calories ?? 0)
        text += "\n"
        text += "Fat: " + String(selectedFruit.nutritions?.fat ?? 0)
        
        return text
    }
}
