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
    
    var presenter: FruitsListViewOutput?
    
    let citrusGenus = Strings.FruitsList.citrusGenus
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fruitsTableView.delegate = self
        fruitsTableView.dataSource = self
        
        fruitsTableView.register(UINib(nibName: "\(FruitCell.self)", bundle: nil), forCellReuseIdentifier: "\(FruitCell.self)")
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = Strings.FruitsList.navigationTitle
        navigationController?.navigationBar.tintColor = UIColor.black
        
        presenter?.retrieveFruitsList()
    }
}

extension FruitsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(FruitCell.self)", for: indexPath) as! FruitCell

        cell.setUp(
            fruitName: viewModel?[indexPath.row].name,
            fruitSugar: viewModel?[indexPath.row].nutritions?.sugar,
            isCitrus: viewModel?[indexPath.row].genus == citrusGenus)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedFruit = viewModel?[indexPath.row] {
            presenter?.routeToFruitDetail(selectedFruit: selectedFruit)
        } else {
            showAlert(message: Strings.Alert.genericError)
        }
    }
}

extension FruitsListViewController: fruitsListViewInput {
    
    func didFailtRetrievingFruits(error: String) {
        showAlert(message: error)
    }
    
    func didRetrieveFruits(fruitsList: [FruitModel]) {
        viewModel = fruitsList
        fruitsTableView.reloadData()
    }
    
    private func showAlert(title: String = Strings.Alert.errorTitle, message: String) {
        let alertController = UIAlertController(title: Strings.Alert.errorTitle, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: Strings.Alert.acceptButtonTitle, style: .default)
        
        alertController.addAction(action)
        
        present(alertController, animated: true)
    }
}
