//
//  FruitsListRouter.swift
//  CoolFruits
//
//  Created by Fray Pineda on 6/8/22.
//

import UIKit

class FruitsListRouter: FruitsListRouterInput {
    
    func createModule() -> UIViewController {
        if let navigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FruitsListNavigationController") as? UINavigationController, let view = navigationController.children.first as? FruitsListViewController {
            let presenter = FruitsListPresenter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = self
            
            return navigationController
        }

        return UIViewController()
    }
}
