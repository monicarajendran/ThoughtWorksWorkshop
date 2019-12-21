//
//  ProductTableViewCell.swift
//  ThoughtWorksWorkshop
//
//  Created by Monica on 20/12/19.
//  Copyright © 2019 Monica. All rights reserved.
//

import UIKit

protocol ProductListTableViewCellProtocol: class {
    func didTapWishlist(key: String, value: Double)
}

class ProductListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var wishlistStepper: UIStepper!
    @IBOutlet weak var wishlistCount: UILabel!
    
    var product: Product?
    weak var delegate: ProductListTableViewCellProtocol?
    
    func configure(withProduct product: Product) {
        
        self.product = product
        
        productName.text = product.name
        price.text = product.price
        wishlistCount.text = getWishListText
        price.text = product.finalPrice
        setPriceColor()
        
        guard let url = URL(string: product.image), let imageData = try? Data(contentsOf: url) else { return }
        productImage.image = UIImage(data: imageData)
        
    }
    
    var getWishListText: String {
        guard let product = product else { return "" }
        return "(" + Int(UserDefaults.standard.double(forKey: product.pid)).description  + ")"
    }
    
    func setPriceColor() {
        if product?.offerPrice != nil {
            price.textColor = .red
        } else {
            price.textColor = .black
        }
    }
    
    @IBAction func wishlistStepperAction(_ sender: UIStepper) {
        guard let product = product else { return }
        self.delegate?.didTapWishlist(key: product.pid, value: sender.value)
        wishlistCount.text = sender.value.description //
    }
    
}
