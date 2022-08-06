//
//  FruitsListPresenter.swift
//  CoolFruits
//
//  Created by Fray Pineda on 5/8/22.
//

import Foundation

class FruitsListPresenter: FruitsListViewOutput {
    
    var requestManager: RequestManagerProvider = RequestManager()
    var view: fruitsListViewInput?
    var router: FruitsListRouterInput?
    
    func retrieveFruitsList() {
        
        requestManager.getAllFruts { fruits, error in
            guard error == nil, let fruits = fruits else {
                self.view?.didFailtRetrievingFruits(error: error?.localizedDescription ?? "Ha ocurrido un error")
                return
            }
            
            self.view?.didRetrieveFruits(fruitsList: fruits)
        }
    }
}
