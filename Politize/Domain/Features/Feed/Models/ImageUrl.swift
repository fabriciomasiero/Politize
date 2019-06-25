//
//  ImageUrl.swift
//  Politize
//
//  Created by Fabrício Masiero on 24/06/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation

public struct ImageUrl: Codable {
    public let value: String
    
    private enum CodingKeys: String, CodingKey {
        case value = "stringValue"
    }
}
