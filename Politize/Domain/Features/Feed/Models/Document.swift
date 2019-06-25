//
//  Document.swift
//  Politize
//
//  Created by Fabrício Masiero on 24/06/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation

public struct Document: Codable {
    public let feeds: [Feed]
    
    private enum CodingKeys: String, CodingKey {
        case feeds = "documents"
    }
    
    
}
