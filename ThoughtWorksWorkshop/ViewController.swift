//
//  ViewController.swift
//  ThoughtWorksWorkshop
//
//  Created by Monica on 20/12/19.
//  Copyright © 2019 Monica. All rights reserved.
//

import UIKit

extension Decodable {
    static func decode(fromJsonData data: Data) -> Self? {
        let decoder = JSONDecoder()
        guard let object = try? decoder.decode(self.self, from: data) else {
            return nil
        }
        return object
    }
}

struct Product: Codable {
    var name: String
    var price: String
    var image: String
}

struct ProductService {
    
    static func fetchProductList() -> Data {
        let bundle =  Bundle(for: ViewController.self)
        let path = bundle.path(forResource: "ProductList", ofType: "json")
        return try! Data(contentsOf: URL(fileURLWithPath: path!))
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var productTableView: UITableView!
    
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProductList()
    }
    
    func loadProductList() {
        let json = ProductService.fetchProductList()
        guard let products = [Product].decode(fromJsonData: json) else { return }
        self.products = products
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
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

class ProdutListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var rate: UILabel!
    
    func configure(withProduct product: Product) {
        productName.text = product.name
        rate.text = product.price
        
        guard let url = URL(string: product.image), let imageData = try? Data(contentsOf: url) else { return }
//        } catch {
//            print("Cannot convert data")
//        }
//
        productImage.image = UIImage(data: imageData)
    }
}

