//
//  FruitDetailPresenterOutput.swift
//  CoolFruits
//
//  Created by Fray Pineda on 6/8/22.
//

import UIKit

protocol FruitDetailPresenterOutput: AnyObject {
    
    func didGetFruitInformation(viewModel: FruitDetailViewModel)
    func setBackground(color: UIColor)
}
