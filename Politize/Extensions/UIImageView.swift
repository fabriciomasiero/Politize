//
//  UIImageView.swift
//  Politize
//
//  Created by Fabrício Masiero on 24/06/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, UIImage>()

extension UIImageView {
    
    func setImage(url: URL) {
        self.image = nil
        if let cachedImage = imageCache.object(forKey: url as AnyObject) {
            set(image: cachedImage)
            return
        }
        downloadImage(url: url)
    }
    private func downloadImage(url: URL) {
        APIClient.sharedInstance.downloadImage(url: url) { imageData, error in
            DispatchQueue.main.async {
                if let imageData = imageData {
                    let image = UIImage(data: imageData)
                    self.set(image: image)
                    imageCache.setObject(image!, forKey: url as AnyObject)
                }
            }
        }
    }
    private func set(image: UIImage?) {
        self.image = image
    }
}
