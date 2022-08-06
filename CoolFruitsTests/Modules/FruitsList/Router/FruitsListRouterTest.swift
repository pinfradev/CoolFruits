//
//  FruitsListRouterTest.swift
//  CoolFruitsTests
//
//  Created by Fray Pineda on 6/8/22.
//

import Quick
import Nimble

@testable import CoolFruits

class FruitsListRouterTest: QuickSpec {
    
    override func spec() {
        
        var sut: FruitsListRouter!
        var view: UIViewController!
        var navigationController: UINavigationController!
        
        beforeEach {
            sut = FruitsListRouter()
            view = FruitsListViewController()
            navigationController = NonAnimatableNavigationController(rootViewController: view)
            
            sut.view = view
        }
        
        afterEach {
            sut = nil
            view = nil
            navigationController = nil
        }
        
        describe("A FruitsListRouter") {
            
            it("Should navigate to details") {
                let selectedFruit = FruitsListMocks().getFruitsList().first!
                
                sut.routeToFruitsDetail(selectedFruit: selectedFruit)
                
                expect(navigationController.topViewController).to(beAKindOf(FruitDetailViewController.self))
                
                let topViewController = navigationController.topViewController as! FruitDetailViewController
                
                expect(topViewController.selectedFruit).notTo(beNil())
                expect(topViewController.title).to(equal(selectedFruit.name))
            }
        }
    }
}
