//
//  HBWaterFallLayout.swift
//  HBWaterFall
//
//  Created by 徐浩博 on 2021/11/16.
//

import UIKit

public class HBWaterFallLayout: UICollectionViewLayout {
    public weak var delegate: HBWaterFallLayoutDelegate!
    
    public var numOfItemPerRow = 2
    public var cellPadding: CGFloat = 3
    public var interItemSpacing: CGFloat = 0
    
    fileprivate var cache: [UICollectionViewLayoutAttributes] = []
    
    fileprivate var contentHeight: CGFloat = 0
    
    fileprivate var contentWeight: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        return collectionView.bounds.width
    }
    
    public override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWeight, height: contentHeight)
    }
    
    public override func prepare() {
        guard cache.isEmpty, let collectionView = collectionView else {
            return
        }
        
        let columnWidth = contentWeight / CGFloat(numOfItemPerRow)
        
        var xOffsets: [CGFloat] = []
        var yOffsets: [CGFloat] = []
        for column in 0..<numOfItemPerRow {
            xOffsets.append(CGFloat(column) * columnWidth)
            yOffsets.append(0)
        }
        
        var column = 0
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let cellSize = delegate.waterfallView(collectionView, sizeOfCellAtIndexPath: indexPath)
            
            let cellWidth = columnWidth
            var cellHeight = cellSize.height * cellWidth / cellSize.width
            
            cellHeight = cellPadding * 2 + cellHeight
            
            let frame = CGRect(x: xOffsets[column], y: yOffsets[column], width: cellWidth, height: cellHeight)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding).insetBy(dx: interItemSpacing, dy: interItemSpacing)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            contentHeight = max(contentHeight, frame.maxY)
            yOffsets[column] = yOffsets[column] + cellHeight
            
            column = column < (numOfItemPerRow - 1) ? (column + 1) : 0
        }
    }
    
    public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visiableAttributes: [UICollectionViewLayoutAttributes] = []
        
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visiableAttributes.append(attributes)
            }
        }
        
        return visiableAttributes
    }
    
    public override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}

