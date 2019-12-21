//
//  UIExtensions.swift
//  ThoughtWorksWorkshop
//
//  Created by Monica on 21/12/19.
//  Copyright © 2019 Monica. All rights reserved.
//

import Foundation
import UIKit

let imageCache: NSCache = NSCache<NSString, UIImage>()

extension UIImageView {

    public func  imageFromServerURL(urlString: String) {
        self.image = nil
        
        if let imageCached = imageCache.object(forKey: urlString as NSString) {
            self.image = imageCached
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            
            guard error == nil else { return }
            DispatchQueue.main.async(execute: { () -> Void in
                guard let image = UIImage(data: data!) else { return }
                imageCache.setObject(image, forKey: urlString as NSString)
                self.image = image
            })
            
        }).resume()
    }}
