//
//  FeedTableViewCell.swift
//  Politize
//
//  Created by Fabrício Masiero on 24/06/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var feedImageView: FeedImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configureCell(feed: Feed) {
        titleLabel.text = feed.fields.title.value
        dateLabel.text = feed.fields.publishedAt.dateString()
        descriptionLabel.text = feed.fields.summary.value
        feedImageView.set(imageUrl: feed.fields.imageUrl.value, title: feed.fields.title.value)
    }
}
