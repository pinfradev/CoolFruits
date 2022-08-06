//
//  FruitsListViewInput.swift
//  CoolFruits
//
//  Created by Fray Pineda on 6/8/22.
//

protocol fruitsListViewInput {
    
    func didRetrieveFruits(fruitsList: [FruitModel])
    func didFailtRetrievingFruits(error: String)
}
