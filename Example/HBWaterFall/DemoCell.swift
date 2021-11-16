//
//  DemoCell.swift
//  HBWaterFall_Example
//
//  Created by 徐浩博 on 2021/11/16.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

class DemoCell: UICollectionViewCell {
    
    static let identifier = "MyCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(image: UIImage) {
        imageView.image = image
    }
}

