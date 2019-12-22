//
//  ProductViewController+TableView.swift
//  ThoughtWorksWorkshop
//
//  Created by Monica on 20/12/19.
//  Copyright © 2019 Monica. All rights reserved.
//

import Foundation
import UIKit

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let products = self.viewModel.products else { return 0 }
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListTableViewCell", for: indexPath) as! ProductListTableViewCell
        guard let products = self.viewModel.products else { return UITableViewCell() }
        cell.delegate = self
        cell.product = products[indexPath.row]
        cell.configure()
        cell.wishlistStepper.value = cell.productWishlistCount
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let products = self.viewModel.products else { return }
        router.route(to: .productDetails, from: self, info: ["product": products[indexPath.row]])
    }
}
