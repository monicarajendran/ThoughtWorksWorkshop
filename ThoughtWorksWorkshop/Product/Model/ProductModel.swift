//
//  ProductModel.swift
//  ThoughtWorksWorkshop
//
//  Created by Monica on 20/12/19.
//  Copyright © 2019 Monica. All rights reserved.
//

import Foundation

struct Product: Codable {
    let pid: String
    let name: String
    let price: String
    let offerPrice: String?
    let description: String?
    let image: String
    
    var finalPrice: String {
        guard let offerPrice = offerPrice else { return price }
        return offerPrice
    }
    
    enum CodingKeys: String, CodingKey {
        case pid
        case name
        case price
        case offerPrice
        case description = "desc"
        case image
    }
}
