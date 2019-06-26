//
//  URLImage.swift
//  Politize
//
//  Created by Fabrício Masiero on 25/06/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation
import SwiftUI

struct URLImage: View {
    
    @ObjectBinding private var imageDownload = ImageDownload()
    

    let text: String
    
    init(url: String, text: String) {
        self.text = text
        self.imageDownload.load(url: url)
    }
    
    var body: some View {
        return FeedImage(image: self.imageDownload.downloadedImage, text: self.text)
    }
}
