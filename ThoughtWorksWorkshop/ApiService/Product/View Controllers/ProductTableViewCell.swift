//
//  ProductTableViewCell.swift
//  ThoughtWorksWorkshop
//
//  Created by Monica on 20/12/19.
//  Copyright © 2019 Monica. All rights reserved.
//

import UIKit

class ProdutListTableViewCell :UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var wishlistStepper: UIStepper!
    @IBOutlet weak var wishlistCount: UILabel!
    
    var product: Product?
    
    func configure(withProduct product: Product) {
        
        self.product = product
        
        productName.text = product.name
        price.text = product.price
        
        guard let url = URL(string: product.image), let imageData = try? Data(contentsOf: url) else { return }
        productImage.image = UIImage(data: imageData)
        price.text = product.offerPrice ?? product.price
        if product.offerPrice != nil {
            price.textColor = .red
        } else {
            price.textColor = .black
        }
    }
    
    @IBAction func wishlistStepperAction(_ sender: UIStepper) {
        wishlistCount.text = sender.value.description
    }
    
}
