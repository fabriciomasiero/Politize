//
//  Feed.swift
//  Politize
//
//  Created by Fabrício Masiero on 24/06/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation
import SwiftUI

public struct Feed: Codable, Hashable, Identifiable {
    
    public var id: Int?
    
    public let name: String
    public let fields: FeedFields
    public let createTime: String
    public let updateTime: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case fields
        case createTime
        case updateTime
    }
}
