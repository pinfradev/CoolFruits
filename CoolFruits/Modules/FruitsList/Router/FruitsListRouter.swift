//
//  FruitsListRouter.swift
//  CoolFruits
//
//  Created by Fray Pineda on 6/8/22.
//

import UIKit

class FruitsListRouter: FruitsListRouterInput {
    
    var view: FruitsListViewController?
    
    func createModule() -> UIViewController {
        if let navigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FruitsListNavigationController") as? UINavigationController, let view = navigationController.children.first as? FruitsListViewController {
            let presenter = FruitsListPresenter()
            let interactor = FruitsListInteractor(presenter: presenter)
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = self
            presenter.interactor = interactor
            self.view = view
            
            return navigationController
        }

        return UIViewController()
    }
    
    func routeToFruitsDetail(selectedFruit: FruitModel) {
        let fruitDetailViewController = FruitDetailViewController()
        fruitDetailViewController.selectedFruit = selectedFruit
        
        fruitDetailViewController.title = selectedFruit.name
        
        view?.navigationController?.pushViewController(fruitDetailViewController, animated: true)
    }
    
//    if selectedFruit.genus == Strings.FruitsList.citrusGenus {
//        navigateToCitrusDetail()
//    } else {
//        navigateToDetail()
//    }
//    func navigateToCitrusDetail() {
//        let vc = FruitDetailViewController(nibName: "FruitDetailCitrusViewController", bundle: nil)
//        vc.title = SelectedFruit.fruit?.name
//        if let view = view as? UIViewController {
//            view.navigationController?.pushViewController(vc, animated: true)
//        }
//    }
//    
//    func navigateToDetail() {
//        let vc = FruitDetailViewController(nibName: "FruitDetailViewController", bundle: nil)
//        vc.title = SelectedFruit.fruit?.name
//        if let view = view as? UIViewController {
//            view.navigationController?.pushViewController(vc, animated: true)
//        }
//    }
}
