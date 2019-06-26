//
//  ImageUrl.swift
//  Politize
//
//  Created by Fabrício Masiero on 24/06/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation
import SwiftUI

public struct ImageUrl: Codable, Hashable, Identifiable {
    
    public var id: Int?
    public let value: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case value = "stringValue"
    }
    
    public func imageUrl() -> URL {
        guard let url = URL(string: value) else {
            return URL(string: "about:blank")!
        }
        return URL(string: "https://www.politize.com.br/wp-content/uploads/2019/04/como-cientistas-fazem-politica-politize-destaque-495x400.jpg")!
    }
}
