//
//  ProductViewController.swift
//  ThoughtWorksWorkshop
//
//  Created by Monica on 20/12/19.
//  Copyright © 2019 Monica. All rights reserved.
//

import UIKit

enum CellIdentifiers {
    case productList
    
    var id: String {
        switch self {
        case .productList:
            return "ProductListTableViewCell"
        }
    }
}

class ProductViewController: UIViewController {

    @IBOutlet weak var productTableView: UITableView!
    
    var products: [Product] = []
    var viewModel: ProductViewModel = ProductViewModel()
    var router: ProductRouter = ProductRouter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        configureTableView()
        loadProducts()
    }
    
    func configureTableView() {
        //TODO: Use extensin for registering cell.
        productTableView.register(UINib(nibName: CellIdentifiers.productList.id, bundle: nil), forCellReuseIdentifier: CellIdentifiers.productList.id)
    }
    
    func loadProducts() {
        viewModel.fetchProducts()
    }
}

extension ProductViewController: ProductViewModelProtocol {
    func didFinishProductsList() {
        DispatchQueue.main.async {
            self.productTableView.reloadData() 
        }
    }
}

extension ProductViewController: ProductListTableViewCellProtocol {
    func didTapWishlist(key: String, value: Double) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
}



