//
//  WishListViewController.swift
//  ThoughtWorksWorkshop
//
//  Created by Monica on 21/12/19.
//  Copyright © 2019 Monica. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController {
    
    @IBOutlet weak var itemsCount: UILabel!
    @IBOutlet weak var totalSavings: UILabel!
    @IBOutlet weak var total: UILabel!

    var wishListViewModel: WishListViewModel = WishListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    func configureViews() {
        itemsCount.text = wishListViewModel.itemsCount.description
    }
}
