//
//  FeedList.swift
//  Politize
//
//  Created by Fabrício Masiero on 25/06/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


struct FeedList: View {
    
    @State var feedListViewModel = FeedListViewModel()
    
    
    var body: some View {
        NavigationView {
            List(feedListViewModel.feeds.identified(by: \.fields.title.value)) { feed in
                FeedCell(feed: feed)
            }
        }.navigationBarTitle(Text("Feed"))
    }
}

struct FeedCell: View {
    
    let feed: Feed
    
    @State var showAlert = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            URLImage(url: feed.fields.imageUrl.value, text: feed.fields.title.value)
            Text(feed.fields.title.value)
                .font(.headline)
                .lineLimit(nil)
            Text(feed.fields.publishedAt.dateString()).lineLimit(1)
            Text(feed.fields.summary.value)
                .lineLimit(nil)
            }.padding(.trailing, 0).tapAction({
                self.showAlert = true
            }).presentation($showAlert, alert: {
                Alert(title: Text(self.feed.fields.title.value), message: Text(self.feed.fields.summary.value), dismissButton: .default(Text("Ok")))
            })
    }
}

#if DEBUG
struct FeedList_Previews: PreviewProvider {
    static var previews: some View {
        FeedList()
    }
}
#endif
