//
//  ViewController.swift
//  CoolFruits
//
//  Created by Luis Alejandro Zapata Gonzalez on 12-07-22.
//

import UIKit

class FruitsListViewController: UIViewController {
    
    @IBOutlet weak var fruitsTableView: UITableView!
    
    var viewModel: [FruitModel]?
    
    var selectedFruit: FruitModel?
    var presenter: FruitsListViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fruitsTableView.delegate = self
        fruitsTableView.dataSource = self
        
        fruitsTableView.register(UINib(nibName: "\(FruitCell.self)", bundle: nil), forCellReuseIdentifier: "\(FruitCell.self)")
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Fruitspedia"
        navigationController?.navigationBar.tintColor = UIColor.black
        
        presenter?.retrieveFruitsList()
    }
    
    func navigateToCitrusDetail() {
        let vc = FruitDetailViewController(nibName: "FruitDetailCitrusViewController", bundle: nil)
        vc.title = SelectedFruit.fruit?.name
        if let navigator = navigationController {
            navigator.pushViewController(vc, animated: true)
        }
    }
    
    func navigateToDetail() {
        let vc = FruitDetailViewController(nibName: "FruitDetailViewController", bundle: nil)
        vc.title = SelectedFruit.fruit?.name
        if let navigator = navigationController {
            navigator.pushViewController(vc, animated: true)
        }
    }
}

extension FruitsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(FruitCell.self)", for: indexPath) as! FruitCell

        cell.setUp(fruitName: viewModel?[indexPath.row].name, fruitSugar: viewModel?[indexPath.row].nutritions?.sugar, isCitrus: viewModel?[indexPath.row].genus == "Citrus")
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SelectedFruit.fruit = viewModel?[indexPath.row]
        if SelectedFruit.fruit?.genus == "Citrus" {
            navigateToCitrusDetail()
        } else {
            navigateToDetail()
        }
    }
}

extension FruitsListViewController: fruitsListViewInput {
    
    func didFailtRetrievingFruits(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "Aceptar", style: .default)
        
        alertController.addAction(action)
        
        present(alertController, animated: true)
    }
    
    func didRetrieveFruits(fruitsList: [FruitModel]) {
        viewModel = fruitsList
        fruitsTableView.reloadData()
    }
}
