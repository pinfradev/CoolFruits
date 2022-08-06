//
//  FruitsListViewControllerTest.swift
//  CoolFruitsTests
//
//  Created by Fray Pineda on 5/8/22.
//

import Quick
import Nimble

@testable import CoolFruits
import UIKit

class FruitsListViewControllerTest: QuickSpec {
    
    override func spec() {
        
        var sut: ViewController!
        var navigationController: NonAnimatableNavigationController!
        
        beforeEach {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            sut = storyboard.instantiateViewController(withIdentifier: "FruitsListViewController") as? ViewController
            navigationController = NonAnimatableNavigationController(rootViewController: sut)
            
            _ = sut.view
        }
        
        afterEach {
            sut = nil
        }
        
        describe("A FruitsListViewController") {
            
            context("When view is loaded") {
                
                it("Should assign delegate and datasource for table") {
                    expect(sut.fruitsTableView.delegate).notTo(beNil())
                    expect(sut.fruitsTableView.dataSource).notTo(beNil())
                }
            }
            
            context("When table has loaded elements ") {
                 var fruitsList = [FruitModel]()
                
                beforeEach {
                    fruitsList = FruitsListMocks().getFruitsList()
                    sut.viewModel.fruits = fruitsList
                    sut.fruitsTableView.reloadData()
                }
                
                it("Should load the amount of cells from viewModel") {
                    expect(sut.fruitsTableView.visibleCells.count).to(equal(3))
                }
                
                it("Should load information from viewModel on cells") {
                    let firstCellName = " Apple"
                    let secondCellName = " Apricot"
                    let thirdCellName  = " *  Lime"
                    let firstCellSugar = "(Sugar:10.3)"
                    let secondCellSugar = "(Sugar:3.2)"
                    let thirdCellSugar = "(Sugar:1.7)"
                    
                    let firstCell = sut.fruitsTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! FruitCell
                    let secondCell = sut.fruitsTableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! FruitCell
                    let thirdCell = sut.fruitsTableView.cellForRow(at: IndexPath(row: 2, section: 0)) as! FruitCell
                    
                    expect(firstCell.fruitNameLabel.text).to(equal(firstCellName))
                    expect(firstCell.fruitSugarLabel.text).to(equal(firstCellSugar))
                    expect(secondCell.fruitNameLabel.text).to(equal(secondCellName))
                    expect(secondCell.fruitSugarLabel.text).to(equal(secondCellSugar))
                    expect(thirdCell.fruitNameLabel.text).to(equal(thirdCellName))
                    expect(thirdCell.fruitSugarLabel.text).to(equal(thirdCellSugar))
                }
                
                context("When user selects a cell") {
                    
                    it("Should navigate to FruitDetailsViewController when user selects non citric fruit") {
                        let table = sut.fruitsTableView!
                        let tableDelegate = table.delegate
                        
                        tableDelegate?.tableView?(table, didSelectRowAt: IndexPath(row: 0, section: 0))
                        
                        expect(navigationController.topViewController).to(beAKindOf(FruitDetailViewController.self))
                        
                        let topViewController = navigationController.topViewController as! FruitDetailViewController
                    }
                }
            }
        }
    }
}
