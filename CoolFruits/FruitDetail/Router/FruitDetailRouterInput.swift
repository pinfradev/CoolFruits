//
//  FruitDetailRouterInput.swift
//  CoolFruits
//
//  Created by Fray Pineda on 6/8/22.
//

import UIKit

protocol FruitDetailRouterInput {
    
    func createModule(selectedFruit: FruitModel) -> UIViewController
}
