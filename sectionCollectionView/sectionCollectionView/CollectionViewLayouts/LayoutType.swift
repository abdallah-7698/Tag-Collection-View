//
//  LayoutType.swift
//  sectionCollectionView
//
//  Created by Abdallah on 17/05/2023.
//

import UIKit


extension UICollectionViewFlowLayout{
    
    enum layoutTypes{
        case left
        case center
    }
    
    static func layout(for type: layoutTypes) -> UICollectionViewFlowLayout {
        switch type {
        case .left:
            return UICollectionViewLeftLayout()
        case .center:
            return UICollectionViewCenterLayout()
        }
    }
    
}

