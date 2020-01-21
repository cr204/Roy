//
//  CategoryListController.swift
//  Roy
//
//  Created by Jasur Rajabov on 1/1/20.
//  Copyright © 2020 Jasur Rajabov. All rights reserved.
//

import UIKit

class CategoryListController: BaseController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear //(red: 1, green: 1, blue: 1, alpha: 0.1)
        cv.showsHorizontalScrollIndicator = true
        cv.isScrollEnabled = true
        cv.isPagingEnabled = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        collectionView.register(EmptyCardCVCell.self, forCellWithReuseIdentifier: "EmptyCardCVCell")
       collectionView.delegate = self
       collectionView.dataSource = self

        self.setupViews()
    }
    

    private func setupViews() {
        print("setupViews()")
        
        view.addSubview(collectionView)
        collectionView.isHidden = false
        //collectionView.contentInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        //collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
        NSLayoutConstraint(item: collectionView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 60).isActive = true
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    
    
    
    // MARK: CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    


}
