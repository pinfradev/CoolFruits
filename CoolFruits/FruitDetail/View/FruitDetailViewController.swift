//
//  FruitDetailViewController.swift
//  CoolFruits
//
//  Created by Luis Alejandro Zapata Gonzalez on 19-07-22.
//

import Foundation
import UIKit

class FruitDetailViewController: UIViewController {
    @IBOutlet weak var familyLabel: UILabel!
    @IBOutlet weak var genusLabel: UILabel!
    @IBOutlet weak var nutritionLabel: UILabel!
    
    var presenter: FruitDetailPresenterInput?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.getFruitInformation()
        presenter?.setBackgroundColor()
    }
}

extension FruitDetailViewController: FruitDetailPresenterOutput {
    
    func setBackground(color: UIColor) {
        view.backgroundColor = color
    }
    
    func didGetFruitInformation(viewModel: FruitDetailViewModel) {
        familyLabel.text = viewModel.family
        genusLabel.text = viewModel.genus
        nutritionLabel.text = viewModel.nutition
    }
}
