//
//  FruitsListInteractorTest.swift
//  CoolFruitsTests
//
//  Created by Fray Pineda on 6/8/22.
//

import Quick
import Nimble

@testable import CoolFruits

class FruitsListInteractorTest: QuickSpec {
    
    override func spec() {
        
        var sut: FruitsListInteractor!
        var presenter: PresenterMock!
        
        beforeEach {
            presenter = PresenterMock()
            sut = FruitsListInteractor(presenter: presenter)
        }
        
        afterEach {
            sut = nil
            presenter = nil
        }
        
        describe("A FruitsListInteractor") {
            
            it("Should retrive list of fruits") {
                let expectation = QuickSpec.current.expectation(description: "retrieve list of fuits")
                let requestManagerMock = RequestManagerMock()
                
                sut.requestManager = requestManagerMock
                presenter.expectation = expectation
                
                sut.retrieveFruitsList()
                
                QuickSpec.current.waitForExpectations(timeout: 5) {_ in
                    expect(presenter.didRetrieveFruitsCount).to(equal(1))
                    expect(presenter.fruitsList).notTo(beNil())
                }
            }
            
            it("Should fail retrieving fruits") {
                let expectation = QuickSpec.current.expectation(description: "retrieve list of fuits")
                let requestManagerMock = RequestManagerMock(responseType: .failure)
                
                sut.requestManager = requestManagerMock
                presenter.expectation = expectation
                
                sut.retrieveFruitsList()
                
                QuickSpec.current.waitForExpectations(timeout: 5) {_ in
                    expect(presenter.didRetrieveFruitsCount).to(equal(0))
                    expect(presenter.didFailRetrievingFruitsCount).to(equal(1))
                    expect(presenter.error).to(equal("Ha ocurrido un error, por favor intente mas tarde"))
                }
            }
        }
    }
    
    class PresenterMock: FruitsListInteractorOutput {
        
        var expectation: XCTestExpectation!
        var didRetrieveFruitsCount = 0
        var didFailRetrievingFruitsCount = 0
        var error: String!
        var fruitsList: [FruitModel]!
        
        func didRetrieveFruits(fruitsList: [FruitModel]) {
            didRetrieveFruitsCount += 1
            self.fruitsList = fruitsList
            expectation.fulfill()
        }
        
        func didFailRetrievingFruits(error: String) {
            didFailRetrievingFruitsCount += 1
            self.error = error
            expectation.fulfill()
        }
    }
}
