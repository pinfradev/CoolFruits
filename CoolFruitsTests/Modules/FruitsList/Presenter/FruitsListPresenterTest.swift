//
//  FruitsListPresenterTest.swift
//  CoolFruitsTests
//
//  Created by Fray Pineda on 5/8/22.
//

import Quick
import Nimble

@testable import CoolFruits

class FruitsListPresenterTest: QuickSpec {

    override func spec() {
        
        var sut: FruitsListPresenter!
        var view: FruitListViewMock!
        var interactor: FruitsListInteractorMock!
        var router: FruitsListRouterMock!
        
        beforeEach {
            sut = FruitsListPresenter()
            view = FruitListViewMock()
            interactor = FruitsListInteractorMock()
            router = FruitsListRouterMock()
            
            sut.view = view
            sut.interactor = interactor
            sut.router = router
        }
        
        afterEach {
            sut = nil
            view = nil
            interactor = nil
            router = nil
        }
        
        describe("A FruitsListPresenter") {
            
            context("When retrieve fruits method in called") {
                
                it("Should retrieve list of fruits from interactor") {
                    sut.retrieveFruitsList()
                    
                    expect(interactor.retrieveFruitsListCount).to(equal(1))
                    expect(view.showLoaderCount).to(equal(1))
                }
            }
            
            context("When it routes to detail view") {
                
                it("Should call route to detail method from router") {
                    let selectedFruit = FruitsListMocks().getFruitsList().first!
                    
                    sut.routeToFruitDetail(selectedFruit: selectedFruit)
                    
                    expect(router.routeToFruitsDetailCount).to(equal(1))
                    expect(router.selectedFruit).notTo(beNil())
                }
            }
            
            context("When it receives fruit list service response") {
                
                it("Should call received fruit list method from view") {
                    let fruitsList = FruitsListMocks().getFruitsList()
                    
                    sut.didRetrieveFruits(fruitsList: fruitsList)
                    
                    expect(view.didRetrieveFruitsCount).to(equal(1))
                    expect(view.fruitsList).notTo(beNil())
                    expect(view.hideLoaderCount).to(equal(1))
                }
                
                it("Should call failed receiving fruit list method from view") {
                    let error = "Ha ocurrido un error"
                    
                    sut.didFailRetrievingFruits(error: error)
                    
                    expect(view.didFailtRetrievingFruitsCount).to(equal(1))
                    expect(view.error).to(equal(error))
                    expect(view.hideLoaderCount).to(equal(1))
                }
            }
        }
    }
        
    class FruitListViewMock: fruitsListViewInput {
        
        var didRetrieveFruitsCount = 0
        var didFailtRetrievingFruitsCount = 0
        var showLoaderCount = 0
        var hideLoaderCount = 0
        var error: String!
        var fruitsList: [FruitModel]!
        
        func didRetrieveFruits(fruitsList: [FruitModel]) {
            didRetrieveFruitsCount += 1
            self.fruitsList = fruitsList
        }
        
        func didFailtRetrievingFruits(error: String) {
            didFailtRetrievingFruitsCount += 1
            self.error = error
        }
        
        
        func showLoader() {
            showLoaderCount += 1
        }
        
        func hideLoder() {
            hideLoaderCount += 1
        }
    }

    class FruitsListInteractorMock: FruitsListInteractorInput {
        
        var retrieveFruitsListCount = 0
        
        func retrieveFruitsList() {
            retrieveFruitsListCount += 1
        }
    }
    
    class FruitsListRouterMock: FruitsListRouterInput {
        
        var routeToFruitsDetailCount = 0
        var selectedFruit: FruitModel!
        
        func createModule() -> UIViewController {
            return UIViewController()
        }
        
        func routeToFruitsDetail(selectedFruit: FruitModel) {
            routeToFruitsDetailCount += 1
            self.selectedFruit = selectedFruit
        }
    }
}
    
    
