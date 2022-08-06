//
//  FruitDetailViewControllerTest.swift
//  CoolFruitsTests
//
//  Created by Fray Pineda on 5/8/22.
//

import Quick
import Nimble

@testable import CoolFruits

class FruitDetailViewControllerTest: QuickSpec {
    
    override func spec() {
        
        var sut: FruitDetailViewController!
        var presenter: FruitDetailPresenterMock!
        
        beforeEach() {
            sut = FruitDetailViewController()
            presenter = FruitDetailPresenterMock()
            
            sut.presenter = presenter
            
            sut.loadViewIfNeeded()
        }
        
        afterEach() {
            sut = nil
            presenter = nil
        }
        
        describe("A FruitDetailViewController") {
            
            context("When view did load") {
                
                it("Should get fruit information from presenter") {
                    expect(presenter.getFruitInformationCount).to(equal(1))
                }
                
                it("Should call set background color method from presenter") {
                    expect(presenter.setBackgroundColorCount).to(equal(1))
                }
            }
            
            context("When fruit information in got") {
                
                it("Should set information on view") {
                    let expectedNutritionInformation = "Sugar: 10.3\nCalories: 52\nFat: 0.4"
                    let expectedFamily = "Family: Rosaceae"
                    let expectedGenus = "Genus: Malus"
                    
                    let viewModel = FruitDetailViewModel(
                        family: "Family: Rosaceae",
                        genus: "Genus: Malus",
                        nutition: "Sugar: 10.3\nCalories: 52\nFat: 0.4")
                    
                    sut.didGetFruitInformation(viewModel: viewModel)
                    
                    expect(sut.familyLabel.text).to(equal(expectedFamily))
                    expect(sut.genusLabel.text).to(equal(expectedGenus))
                    expect(sut.nutritionLabel.text).to(equal(expectedNutritionInformation))
                }
            }
        }
    }
    
    class FruitDetailPresenterMock: FruitDetailPresenterInput {

        var getFruitInformationCount = 0
        var setBackgroundColorCount = 0
        
        func getFruitInformation() {
            getFruitInformationCount += 1
        }
        
        func setBackgroundColor() {
            setBackgroundColorCount += 1
        }
    }
}
