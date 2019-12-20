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
