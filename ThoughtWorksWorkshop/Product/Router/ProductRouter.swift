//
//  ProductRouter.swift
//  ThoughtWorksWorkshop
//
//  Created by Monica on 21/12/19.
//  Copyright © 2019 Monica. All rights reserved.
//

import Foundation
import UIKit

protocol Router {
    associatedtype AppRouter
    func route(
        to router: AppRouter,
        from source: UIViewController,
        info: Any?
    )
}

enum ProductRoute: String {
    case productDetails = "ProductDetailsViewController"
}

class ProductRouter: Router {
    
    typealias AppRouter = ProductRoute
    
    func route(to router: ProductRoute, from source: UIViewController, info: Any?) {
        switch router {
            case .productDetails:
            
            let productVc =  UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: router.rawValue) as! ProductDetailsViewController
            guard let infoDict = info as? [String: Any], let product = infoDict["product"] as? Product else { return }
            productVc.product = product
            source.navigationController?.pushViewController(productVc, animated: true)
        }
    }
    
}
