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
        
        beforeEach {
            sut = FruitsListPresenter()
            view = FruitListViewMock()
            
            sut.view = view
        }
        
        afterEach {
            sut = nil
            view = nil
        }
        
        describe("A FruitsListPresenter") {
            
            context("When retrieve fruits method in called") {
                
                it("Should retrive list of fruits") {
                    let expectation = QuickSpec.current.expectation(description: "retrieve list of fuits")
                    let requestManagerMock = RequestManagerMock()

                    sut.requestManager = requestManagerMock
                    view.expectation = expectation
                    
                    sut.retrieveFruitsList()
                    
                    QuickSpec.current.waitForExpectations(timeout: 5) {_ in
                        expect(view.didRetrieveFruitsCount).to(equal(1))
                    }
                }
                
                it("Should fail retrieving fruits") {
                    let expectation = QuickSpec.current.expectation(description: "retrieve list of fuits")
                    let requestManagerMock = RequestManagerMock(responseType: .failure)

                    sut.requestManager = requestManagerMock
                    view.expectation = expectation
                    
                    sut.retrieveFruitsList()
                    
                    QuickSpec.current.waitForExpectations(timeout: 5) {_ in
                        expect(view.didRetrieveFruitsCount).to(equal(0))
                        expect(view.didFailtRetrievingFruitsCount).to(equal(1))
                        expect(view.error).to(equal("Ha ocurrido un error, por favor intente mas tarde"))
                    }
                }
            }
        }
    }
    
    class FruitListViewMock: fruitsListViewInput {
        
        var didRetrieveFruitsCount = 0
        var didFailtRetrievingFruitsCount = 0
        var expectation: XCTestExpectation!
        var error: String!
        
        func didRetrieveFruits(fruitsList: [FruitModel]) {
            didRetrieveFruitsCount += 1
            expectation.fulfill()
        }
        
        func didFailtRetrievingFruits(error: String) {
            didFailtRetrievingFruitsCount += 1
            self.error = error
            expectation.fulfill()
        }
    }
}
