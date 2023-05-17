//
//  ViewController.swift
//  sectionCollectionView
//
//  Created by Abdallah on 22/01/2023.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    //MARK: - Variables
    let cources = ["Database" , "Data Structure" , "OOP" , "Information System" , "IT" , "Swiftware 1" , "software 2" , "Algorithm" , "design"]
    //MARK: - IBOutlet
    let courcesCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout.layout(for: .center)
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(UINib(nibName: courceCell.reuseId, bundle: nil), forCellWithReuseIdentifier: courceCell.reuseId)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    //MARK: - Helper Function
    private func configureCollectionView(){
        view.addSubview(courcesCollectionView)
        courcesCollectionView.dataSource = self
        courcesCollectionView.delegate = self
        courcesCollectionView.allowsMultipleSelection = true
        NSLayoutConstraint.activate([
            courcesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            courcesCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            courcesCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            courcesCollectionView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    // MARK:  Collection View Datasource func
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: courceCell.reuseId, for: indexPath) as? courceCell else{fatalError()}
        cell.setTitle(cources[indexPath.row])
        return cell
    }
    
    // MARK:  Collection View Delegate FlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cources[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)]).width + 25, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? courceCell else {fatalError()}
        if cell.isSelected == true {
            cell.backView.backgroundColor = #colorLiteral(red: 0.8743465543, green: 0.1577501893, blue: 0.2328583598, alpha: 1)
            cell.cellName.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? courceCell else {fatalError()}
        cell.backView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        cell.cellName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        //        print(collectionView.indexPathsForSelectedItems)
    }
    
    
}

