//
//  CategoryListController.swift
//  Roy
//
//  Created by Jasur Rajabov on 1/1/20.
//  Copyright © 2020 Jasur Rajabov. All rights reserved.
//

import UIKit

enum ListType {
    case question
    case history
}

class CategoryListController: BaseController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var categories: [CategoryItem] = []
    var listCategory: ListType!
    
    let category = [(image: "categeory1", text: "Relationships"),
                    (image: "categeory2", text: "Health"),
                    (image: "categeory3", text: "Education"),
                    (image: "categeory4", text: "Bullying"),
                    (image: "categeory5", text: "Sex"),
                    (image: "categeory6", text: "Addiction"),
                    (image: "categeory7", text: "Family"),
                    (image: "categeory8", text: "Suicidal Thoughts"),
                    (image: "categeory9", text: "Money"),
                    (image: "categeory10", text: "Grief"),
                    (image: "categeory11", text: "Other")
                    ]
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear //(red: 1, green: 1, blue: 1, alpha: 0.1)
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.isScrollEnabled = true
        cv.isPagingEnabled = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(CategorItemCVCell.self, forCellWithReuseIdentifier: "CategorItemCVCell")
        collectionView.delegate = self
        collectionView.dataSource = self

        self.fetchCategoryList()
    }
    

    func setupViews() {
        view.addSubview(collectionView)
        collectionView.isHidden = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
        view.addConstraintsWithFormat(format: "H:|-15-[v0]-15-|", views: collectionView)
        NSLayoutConstraint(item: collectionView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 100).isActive = true
        NSLayoutConstraint(item: collectionView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
//        collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    
    
    
    // MARK: CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategorItemCVCell", for: indexPath) as! CategorItemCVCell
        let cData = categories[indexPath.row]
        cell.image.image = UIImage(named: "categeory\(cData.category_id)")
        cell.label.text = cData.category_name
        cell.initViews()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let estSize: CGFloat = ceil(view.frame.size.width - 45.0) / 2
        return CGSize(width: estSize, height: estSize)
    }
    
    // line spacing for vertical
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let type = self.listCategory {
            
            switch type {
            case .question:
                let destination = AskQuestionController()
                destination.categoryId = categories[indexPath.row].category_id
                navigationController?.pushViewController(destination, animated: true)
            case .history:
                let destination = HistoryQeustionsController()
                destination.categoryId = categories[indexPath.row].category_id
                navigationController?.pushViewController(destination, animated: true)
            }
            
        }
    }
    
}


class CategorItemCVCell: UICollectionViewCell {
    
    let image: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Category"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initViews() {
        
        self.contentView.backgroundColor = Colors.brown
        self.contentView.layer.cornerRadius = 3
        
        self.contentView.addSubview(image)
        image.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.6).isActive = true
        image.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.6).isActive = true
        image.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
//        image.centerYAnchor.constraint(equalToSystemSpacingBelow: self.contentView.centerYAnchor, multiplier: 0.5).isActive = true
        NSLayoutConstraint(item: image, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1, constant: -10).isActive = true
        
        self.contentView.addSubview(label)
        self.contentView.addConstraintsWithFormat(format: "H:|-5-[v0]-5-|", views: label)
        NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1, constant: -35).isActive = true
        
    }
    
    
}
