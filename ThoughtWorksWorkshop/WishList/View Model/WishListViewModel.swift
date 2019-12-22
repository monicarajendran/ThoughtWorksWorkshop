//
//  WishListViewModel.swift
//  ThoughtWorksWorkshop
//
//  Created by Monica on 21/12/19.
//  Copyright © 2019 Monica. All rights reserved.
//

import Foundation

class WishListViewModel {
    
    init() { }
    
    var wishListItems: WishListItems = WishListItems(wishList: [])
    
    private var persistedWishListItems: WishListItems? {
        guard let data = UserDefaultsService.shared.getData(forKey: .wishList) else { return nil }
        guard let wishlist = WishListItems.decode(fromPlistData: data) else { return nil }
        self.wishListItems = wishlist
        return wishlist
    }
    
    var itemsCount: Int {
        guard let persistedWishlist = persistedWishListItems else { return 0 }
        let count = Int(persistedWishlist.wishList.reduce(0) { $0 + $1.count })
        return count
    }
    
}
