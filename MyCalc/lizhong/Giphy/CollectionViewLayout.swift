//
//  CollectionViewLayout.swift
//  MyCalc
//
//  Created by ChungHyun Lee on 2020/05/05.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import UIKit

//heightForPhotoAtIndexPath만 쓸 건데 모든 접근을 가능하게 할 필요는 없으니까 결국
//protocol쪽에서 정의한 메서드만 구현할 수 있도록 하는 것. viewController에서 쓰게 끔
protocol CollectionViewLayoutDelegate: class {
    // image의 height
    func collectionView(_ collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat
}

class CollectionViewLayout: UICollectionViewLayout {
    // delegate 설정
    weak var delegate: CollectionViewLayoutDelegate!
    
    // property 설정
    fileprivate var numberOfColumns = 2
    fileprivate var cellPadding: CGFloat = 4
    
    // attributes cache arrary
    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    
    // 내용물 높이와 크기
    fileprivate var contentHeight: CGFloat = 0
    
    
    //if let 보다 예외처리에 대한 여러가지의 변수 연산이 필요할 때는 guard let이 더 쓰기 편할 듯
    fileprivate var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        
        //contentInset은 safe area 또는 스크롤뷰 모서리에 삽입되는 사용자 지정 거리
        let insets = collectionView.contentInset
        //전체 width에서 좌우 insets 거리를 빼 줘야 안에 들어갈 수 있는 width가 나옴
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    //CGSize는 너비와 높이 값을 포함하는 구조체
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        // 한 번 계산
        guard cache.isEmpty == true, let collectionView = collectionView else {
            return
        }
        
        // 한 줄에 몇개의 아이템이 오는지 그것으로 width 결정
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset = [CGFloat]()
        for column in 0 ..< numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        //repeating?
        var column = 0
        var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
        
        for item in 0 ..< collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            
            // delegate에게 그림의 높이와 cell frame을 계산
            
            let photoHeight = delegate.collectionView(collectionView, heightForPhotoAtIndexPath: indexPath)
            let height = cellPadding * 1 + photoHeight
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            // frame생성 및 cache에 추가
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            // 내용물 높이 보정값으로 수정
            contentHeight = max(contentHeight, frame.maxY)
            yOffset[column] = yOffset[column] + height
            
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
    }
    
    //CGRect는 origin, 즉 사각형의 위치까지도 포함하는 구조체임
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        // cache에서 item찾기
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}
