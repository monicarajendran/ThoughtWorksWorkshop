//
//  ProductViewController.swift
//  ThoughtWorksWorkshop
//
//  Created by Monica on 20/12/19.
//  Copyright © 2019 Monica. All rights reserved.
//

import UIKit

//struct ProductService {
//
//    static func fetchProductList() -> Data {
//        let bundle =  Bundle(for: ProductViewController.self)
//        let path = bundle.path(forResource: "ProductList", ofType: "json")
//        return try! Data(contentsOf: URL(fileURLWithPath: path!))
//    }
//}

class ProductViewController: UIViewController {

    @IBOutlet weak var productTableView: UITableView!
    
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProductList()
    }
    
    func loadProductList() {
//        guard let productData =  else { return }
//        self.products = [Product].decode(fromJsonData: productData)
    }
}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProdutListTableViewCell", for: indexPath) as? ProdutListTableViewCell
            else { return UITableViewCell() }
        cell.configure(withProduct: products[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

