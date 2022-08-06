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
        
        beforeEach() {
            sut = FruitDetailViewController()
        }
        
        afterEach() {
            sut = nil
        }
        
        describe("A FruitDetailViewController") {
           
            context("When view did load") {
                
                it("Should set fruit infromation") {
                    let fruit = FruitsListMocks().getFruitsList().first
                    sut.selectedFruit = fruit
                    _ = sut.view
                    
                    let expectedNutritionInformation = "Sugar: 10.3\nCalories: 52\nFat: 0.4"
                    let expectedFamily = "Family: \(fruit!.family!)"
                    let expectedGenus = "Genus: \(fruit!.genus!)"
                    
                    expect(sut.familyLabel.text).to(equal(expectedFamily))
                    expect(sut.genusLabel.text).to(equal(expectedGenus))
                    expect(sut.nutritionLabel.text).to(equal(expectedNutritionInformation))
                }
            }
        }
    }
}
