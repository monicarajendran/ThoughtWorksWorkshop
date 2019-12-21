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
    
    func configure() {
        guard let product = product else { return }
        productName.text = product.name
        price.text = product.price
        wishlistCount.text = getWishListText(forCount: productWishlistCount)
        price.text = product.finalPrice
        setPriceColor()
        productImage.imageFromServerURL(urlString: product.image)
    }
    
    func getWishListText(forCount count: Double) -> String {
        "(" + Int(count).description  + ")"
    }
    
    var productWishlistCount: Double {
        guard let product = product else { return 0.0 }
        return UserDefaults.standard.double(forKey: product.pid)
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
        wishlistCount.text = getWishListText(forCount: sender.value)
    }
    
}
