//
//  courceCell.swift
//  sectionCollectionView
//
//  Created by Abdallah on 23/01/2023.
//

import UIKit

class courceCell: UICollectionViewCell {
    //MARK: - Variables
    static let reuseId = "courceCell"
    //MARK: - IBOutlet
    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.cornerRadius = backView.frame.height / 3
            backView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        }
    }
    @IBOutlet weak var cellName: UILabel!

    
    //MARK: - Helper Function
    func setTitle(_ title : String){
        cellName.text = title
    }
    
}
