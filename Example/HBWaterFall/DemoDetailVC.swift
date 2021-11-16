//
//  DemoDetailVC.swift
//  HBWaterFall_Example
//
//  Created by 徐浩博 on 2021/11/16.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

class DemoDetailVC: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = view.bounds
    }

    func config(image: UIImage) {
        imageView.image = image
    }
}

