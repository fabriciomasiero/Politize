//
//  FeedImage.swift
//  Politize
//
//  Created by Fabrício Masiero on 25/06/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct FeedImage: View {
    
    let image: UIImage?
    let text: String
    
    var body: some View {
            Group {
                if image != nil {
                    Image(uiImage: image!)
                        .resizable()
                        .scaledToFit()
                } else {
                    VStack {
                        Text(text)
                            .color(.white)
                            .font(.custom("Helvetica-Bold", size: 40))
                            .shadow(color: .black, radius: 0.5, x: 3, y: 5)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 250, maxHeight: .infinity, alignment: .center)
                    }
                }
            }.background(Color.gray)
    }
}
