//
//  PublishedAt.swift
//  Politize
//
//  Created by Fabrício Masiero on 24/06/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation

public struct PublishedAt: Codable {
    
    public let value: String
    
    private enum CodingKeys: String, CodingKey {
        case value = "timestampValue"
    }
}
