//
//  ViewModel.swift
//  ThoughtWorksWorkshop
//
//  Created by Monica on 20/12/19.
//  Copyright © 2019 Monica. All rights reserved.
//

import Foundation

protocol ProductViewModelProtocol {
    func didFinishProductsList()
}

class ProductViewModel {
    
    var apiService: ProductService
    var delegate: ProductViewModelProtocol?
    
    var products: [Product]? {
        didSet {
            self.delegate?.didFinishProductsList()
        }
    }
    
    init(apiService: ProductService = ProductService()) {
        self.apiService = apiService
    }
    
    
    
    func fetchProducts() {
        apiService.fetchProducts { (data, _) in
            guard let data = data, let productList = [Product].decode(fromJsonData: data) else { return }
            self.products = productList
        }
    }
    
}
