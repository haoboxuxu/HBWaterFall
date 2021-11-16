//
//  Delegate.swift
//  HBWaterFall
//
//  Created by 徐浩博 on 2021/11/16.
//

import UIKit

public protocol HBWaterFallLayoutDelegate: AnyObject {
    func waterfallView(_ collectionView: UICollectionView, sizeOfCellAtIndexPath indexPath: IndexPath) -> CGSize
}
