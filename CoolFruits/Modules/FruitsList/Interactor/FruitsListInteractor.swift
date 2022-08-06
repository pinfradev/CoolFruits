//
//  FruitsListInteractor.swift
//  CoolFruits
//
//  Created by Fray Pineda on 6/8/22.
//

class FruitsListInteractor: FruitsListInteractorInput {
    
    weak var presenter: FruitsListInteractorOutput!
    var requestManager: RequestManagerProvider = RequestManager()
    
    init(presenter: FruitsListInteractorOutput) {
        self.presenter = presenter
    }
    
    func retrieveFruitsList() {
        requestManager.getAllFruts { fruits, error in
            guard error == nil, let fruits = fruits else {
                self.presenter.didFailRetrievingFruits(error: error?.localizedDescription ?? Strings.Alert.genericError)
                return
            }
            
            self.presenter.didRetrieveFruits(fruitsList: fruits)
        }
    }
}
