//
//  Service.swift
//  ThoughtWorksWorkshop
//
//  Created by Monica on 20/12/19.
//  Copyright © 2019 Monica. All rights reserved.
//

import Foundation
import Moya

class ProductHelperService {
    
    func fetchProduct() {
        ProductService().fetchProducts { (data, err) in
            
        }
    }
}
