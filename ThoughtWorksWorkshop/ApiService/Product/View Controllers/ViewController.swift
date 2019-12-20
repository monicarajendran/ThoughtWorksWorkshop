//
//  ProductViewController.swift
//  ThoughtWorksWorkshop
//
//  Created by Monica on 20/12/19.
//  Copyright © 2019 Monica. All rights reserved.
//

import UIKit
class ProductViewController: UIViewController {

    @IBOutlet weak var productTableView: UITableView!
    
    var products: [Product] = []
    var viewModel: ProductViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ProductViewModel()
        viewModel?.delegate = self
        viewModel?.fetchProducts()
    }

}

extension ProductViewController: ProductViewModelProtocol {
    func didFinishProductsList() {
        DispatchQueue.main.async {
            self.productTableView.reloadData()
        }
    }
}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let products = self.viewModel?.products else { return 0 }
        return products.count//products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProdutListTableViewCell", for: indexPath) as? ProdutListTableViewCell
            else { return UITableViewCell() }
        guard let products = self.viewModel?.products else { return UITableViewCell() }
        cell.configure(withProduct: products[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

