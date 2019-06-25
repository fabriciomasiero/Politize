//
//  Feed.swift
//  Politize
//
//  Created by Fabrício Masiero on 24/06/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation

public struct Feed: Codable {
    public let name: String
    public let fields: FeedFields
    public let createTime: String
    public let updateTime: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case fields
        case createTime
        case updateTime
    }
}
