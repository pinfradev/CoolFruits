//
//  FruitsListPresenter.swift
//  CoolFruits
//
//  Created by Fray Pineda on 5/8/22.
//

import Foundation
import UIKit

class FruitsListPresenter: FruitsListViewOutput {

    weak var view: fruitsListViewInput?
    var router: FruitsListRouterInput?
    var interactor: FruitsListInteractorInput?
    
    func retrieveFruitsList() {
        interactor?.retrieveFruitsList()
    }
    
    func routeToFruitDetail(selectedFruit: FruitModel) {
        router?.routeToFruitsDetail(selectedFruit: selectedFruit)
    }
}

extension FruitsListPresenter: FruitsListInteractorOutput {
    
    func didRetrieveFruits(fruitsList: [FruitModel]) {
        view?.didRetrieveFruits(fruitsList: fruitsList)
    }
    
    func didFailRetrievingFruits(error: String) {
        view?.didFailtRetrievingFruits(error: error)
    }
}
