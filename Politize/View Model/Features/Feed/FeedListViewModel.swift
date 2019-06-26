//
//  FeedListViewModel.swift
//  Politize
//
//  Created by Fabrício Masiero on 25/06/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation
import SwiftUI
import Combine



final class FeedListViewModel: BindableObject {
    
    private let imageCache = NSCache<AnyObject, UIImage>()
    
    var feeds = [Feed]() {
        didSet {
            DispatchQueue.main.async {
                self.didChange.send(self)
            }
        }
    }
    
    let didChange = PassthroughSubject<FeedListViewModel, Never>()
    
    init() {
        fetchFeeds()
    }
    
    
    private func fetchFeeds() {
        APIClient.sharedInstance.retrieveFeed(url: "politize-feed") { feedList, error in
            guard let feeds = feedList else {
                return
            }
            let sortedFeeds = feeds.sorted(by: {$0.fields.publishedAt.date().timeIntervalSince1970 < $1.fields.publishedAt.date().timeIntervalSince1970})
            self.feeds = sortedFeeds
        }
    }
}
