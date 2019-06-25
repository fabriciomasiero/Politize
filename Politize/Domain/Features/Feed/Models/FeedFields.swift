//
//  FeedFields.swift
//  Politize
//
//  Created by Fabrício Masiero on 24/06/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation

public struct FeedFields: Codable {
    public let imageUrl: ImageUrl
    private let publishedAt: PublishedAt
    public let summary: Summary
    public let title: Title
    public var publishedDate: Date?
    
    private enum CodingKeys: String, CodingKey {
        case imageUrl = "thumbnail"
        case publishedAt = "published_at"
        case summary
        case title
    }
    
}
