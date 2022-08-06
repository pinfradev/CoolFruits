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
        
        var sut: FruitsListViewController!
        var navigationController: NonAnimatableNavigationController!
        var presenter: FruitsListPresenterMock!
        
        beforeEach {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            presenter = FruitsListPresenterMock()
            
            sut = storyboard.instantiateViewController(withIdentifier: "FruitsListViewController") as? FruitsListViewController
            
            sut.presenter = presenter
            
            navigationController = NonAnimatableNavigationController(rootViewController: sut)
            
            _ = sut.view
        }
        
        afterEach {
            sut = nil
            navigationController = nil
        }
        
        describe("A FruitsListViewController") {
            
            context("When view is loaded") {
                
                it("Should assign delegate and datasource for table") {
                    expect(sut.fruitsTableView.delegate).notTo(beNil())
                    expect(sut.fruitsTableView.dataSource).notTo(beNil())
                }
                
                it("Should retrieve fruit List") {
                    expect(presenter.retrieveFruitsListCount).to(equal(1))
                }
            }
            
            context("When table has loaded elements ") {
                 var fruitsList = [FruitModel]()
                
                beforeEach {
                    fruitsList = FruitsListMocks().getFruitsList()
                    sut.viewModel = fruitsList
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
                    }
                }
            }
            
            context("when retrieves list o fruits") {
                
                it("Should set viewModel and reload data") {
                    sut.viewModel = nil
                    let fruitsList = FruitsListMocks().getFruitsList()
                    
                    sut.didRetrieveFruits(fruitsList: fruitsList)
                    
                    expect(sut.viewModel?.count).to(equal(3))
                    expect(sut.fruitsTableView.visibleCells.count).to(equal(3))
                }
            }
        }
    }
    
    class FruitsListPresenterMock: FruitsListViewOutput {
        
        var retrieveFruitsListCount = 0
        
        func retrieveFruitsList() {
            retrieveFruitsListCount += 1
        }
    }
    
    class NoAnimationsFruitsListViewController: FruitsListViewController {
        
    }
}
