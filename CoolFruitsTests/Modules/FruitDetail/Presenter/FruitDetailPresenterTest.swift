//
//  FruitDetailPresenterTest.swift
//  CoolFruitsTests
//
//  Created by Fray Pineda on 6/8/22.
//

import Quick
import Nimble

@testable import CoolFruits

class FruitDetailPresenterTest: QuickSpec {
    
    override func spec() {
        
        var sut: FruitDetailPresenter!
        var view: FruitDetailViewMock!
        
        beforeEach {
            let selectedFruit = FruitsListMocks().getFruitsList().first!
            sut = FruitDetailPresenter(selectedFruit: selectedFruit)
            view = FruitDetailViewMock()
            
            sut.view = view
        }
        
        afterEach {
            sut = nil
            view = nil
        }
        
        describe("A FruitDetailPresenter") {
            
            it("Should retrieve viewModel to view") {
                sut.getFruitInformation()
                
                expect(view.didGetFruitInformationCount).to(equal(1))
                expect(view.viewModel).notTo(beNil())
            }
            
            context("When selected fruit is citrus") {
                
                it("Should call set background method from view") {
                    sut.selectedFruit = FruitsListMocks().getFruitsList().last!
                    
                    sut.setBackgroundColor()
                    
                    expect(view.setBackgroundCount).to(equal(1))
                    expect(view.color).to(equal(UIColor.systemGreen))
                }
            }
            
            context("When selected fruit is not citrus") {
                
                it("Should not call set background method from view") {
                    sut.selectedFruit = FruitsListMocks().getFruitsList().first!
                    
                    sut.setBackgroundColor()
                    
                    expect(view.setBackgroundCount).to(equal(0))
                    expect(view.color).to(beNil())
                }
            }
        }
    }
    
    class FruitDetailViewMock: FruitDetailPresenterOutput {
        var didGetFruitInformationCount = 0
        var setBackgroundCount = 0
        var viewModel: FruitDetailViewModel!
        var color: UIColor!
        
        func didGetFruitInformation(viewModel: FruitDetailViewModel) {
            didGetFruitInformationCount += 1
            self.viewModel = viewModel
        }
        
        func setBackground(color: UIColor) {
            setBackgroundCount += 1
            self.color = color
        }
    }
}
