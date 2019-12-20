//
//  ProductModel.swift
//  ThoughtWorksWorkshop
//
//  Created by Monica on 20/12/19.
//  Copyright © 2019 Monica. All rights reserved.
//

import Foundation

struct Product: Codable {
    var pid: String
    var name: String
    var price: String
    var offerPrice: String?
    var description: String?
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case pid
        case name
        case price
        case offerPrice
        case description = "desc"
        case image
    }
}
