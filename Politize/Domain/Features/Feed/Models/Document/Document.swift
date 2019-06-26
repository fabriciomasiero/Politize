//
//  Document.swift
//  Politize
//
//  Created by Fabrício Masiero on 24/06/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation
import SwiftUI

public struct Document: Codable, Hashable, Identifiable {
    
    public var id: Int?
    
    public let feeds: [Feed]
    
    private enum CodingKeys: String, CodingKey {
        case id
        case feeds = "documents"
    }
    
    
}
