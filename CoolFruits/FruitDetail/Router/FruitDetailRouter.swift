//
//  FruitDetailRouter.swift
//  CoolFruits
//
//  Created by Fray Pineda on 6/8/22.
//

import UIKit

class FruitDetailRouter: FruitDetailRouterInput {
    
    func createModule(selectedFruit: FruitModel) -> UIViewController {
        let view = FruitDetailViewController()
        view.title = selectedFruit.name
        
        let presenter = FruitDetailPresenter(selectedFruit: selectedFruit)
        
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
}
