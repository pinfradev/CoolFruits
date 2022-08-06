//
//  FruitCell.swift
//  CoolFruits
//
//  Created by Luis Alejandro Zapata Gonzalez on 19-07-22.
//

import UIKit

class FruitCell: UITableViewCell {
    @IBOutlet weak var fruitNameLabel: UILabel!
    @IBOutlet weak var fruitSugarLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUp(fruitName: String?, fruitSugar: Double?, isCitrus: Bool) {
        guard let fruitName = fruitName else {
            return
        }

        guard let fruitSugar = fruitSugar else {
            return
        }

        fruitNameLabel.text = "\(isCitrus ? " * " : "") \(fruitName)"
        fruitSugarLabel.text = "(Sugar:" + String(fruitSugar) + ")"
    }
}
