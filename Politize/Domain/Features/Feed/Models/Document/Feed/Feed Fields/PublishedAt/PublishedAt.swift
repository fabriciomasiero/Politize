//
//  PublishedAt.swift
//  Politize
//
//  Created by Fabrício Masiero on 24/06/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation
import SwiftUI

public struct PublishedAt: Codable, Hashable, Identifiable {
    
    public var id: Int?
    
    public let value: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case value = "timestampValue"
    }
    public func dateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        dateFormatter.locale = Locale(identifier: "pt")
        
        let dateToShow = dateFormatter.string(from: date())
        return dateToShow
        
    }
    public func date() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: value) else {
            return Date()
        }
        return date
    }
}
