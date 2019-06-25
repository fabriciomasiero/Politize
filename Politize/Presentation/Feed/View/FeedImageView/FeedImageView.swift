//
//  FeedImageView.swift
//  Politize
//
//  Created by Fabrício Masiero on 24/06/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import UIKit

class FeedImageView: UIImageView {
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 1
        label.layer.shadowOpacity = 1
        label.layer.shadowOffset = CGSize(width: 4, height: 2)
        label.layer.masksToBounds = false
        
        return label
    }()
    
    
    public func set(image: UIImage?, title: String?) {
        
    }
    public func set(imageUrl: String?, title: String?) {
        
        titleLabel.text = title
        if let imageUrl = imageUrl, let url = URL(string: imageUrl) {
            setImage(url: url)
            titleLabel.removeFromSuperview()
        } else {
            backgroundColor = .gray
            self.image = nil
            self.addSubview(titleLabel)
            titleLabelConstraints()
        }
    }
    
    private func titleLabelConstraints() {
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
