//
//  FeedFields.swift
//  Politize
//
//  Created by Fabrício Masiero on 24/06/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation
import SwiftUI

public struct FeedFields: Codable, Hashable, Identifiable {
    
    public var id: Int?
    public let imageUrl: ImageUrl
    public let publishedAt: PublishedAt
    public let summary: Summary
    public let title: Title
    public var publishedDate: Date?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case imageUrl = "thumbnail"
        case publishedAt = "published_at"
        case summary
        case title
    }
}
