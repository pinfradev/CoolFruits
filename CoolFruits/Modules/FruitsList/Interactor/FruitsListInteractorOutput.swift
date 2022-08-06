//
//  FruitsListInteractorOutput.swift
//  CoolFruits
//
//  Created by Fray Pineda on 6/8/22.
//

protocol FruitsListInteractorOutput: AnyObject {
    
    func didRetrieveFruits(fruitsList: [FruitModel])
    func didFailRetrievingFruits(error: String)
}
