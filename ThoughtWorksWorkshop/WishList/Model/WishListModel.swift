//
//  WishListModel.swift
//  ThoughtWorksWorkshop
//
//  Created by Monica on 21/12/19.
//  Copyright © 2019 Monica. All rights reserved.
//

import Foundation

struct WishListItems: Codable {
    let wishList: [WishList]
}

struct WishList: Codable {
    let product: Product
    let count: Double
}
