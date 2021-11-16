//
//  HBWaterFallView.swift
//  HBWaterFall
//
//  Created by 徐浩博 on 2021/11/16.
//

import UIKit

public class HBWaterFallView: UICollectionView {
    
    public init(frame: CGRect) {
        super.init(frame: frame, collectionViewLayout: HBWaterFallLayout())
    }
    
    public init() {
        super.init(frame: .zero, collectionViewLayout: HBWaterFallLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var waterFallLayout: UICollectionViewLayout {
        get {
            return self.collectionViewLayout
        }
        set {
            super.collectionViewLayout = newValue
        }
    }
}
