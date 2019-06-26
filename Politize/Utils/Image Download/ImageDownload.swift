//
//  ImageDownload.swift
//  Politize
//
//  Created by Fabrício Masiero on 25/06/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import UIKit

final class ImageDownload: BindableObject {
        
    var downloadedImage: UIImage?
    
    
    let didChange = PassthroughSubject<ImageDownload?, Never>()
    
    func load(url: String) {
        guard let imageURL = URL(string: url) else {
            return
        }
        setImage(url: imageURL)
    }
    
    
    func setImage(url: URL) {
        downloadedImage = nil
        if let cachedImage = UserDefaults.standard.object(forKey: url.absoluteString) as? Data {
            set(image: UIImage(data: cachedImage))
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
                    UserDefaults.standard.set(imageData, forKey: url.absoluteString)
                    UserDefaults.standard.synchronize()
                }
            }
        }
    }
    private func set(image: UIImage?) {
        downloadedImage = image
        DispatchQueue.main.async {
            self.didChange.send(self)
        }
    }
}
