//
//  ButtonThumbs.swift
//  Roy
//
//  Created by Jasur Rajabov on 1/25/20.
//  Copyright © 2020 Jasur Rajabov. All rights reserved.
//

import UIKit

class ButtonThumbs: UIView {
    
    enum ButtonType {
        case up
        case down
    }
    
    let iconImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let labelCount: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = Colors.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear //(red: 0, green: 1, blue: 0, alpha: 0.1)
        btn.translatesAutoresizingMaskIntoConstraints = false
       return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func set(type: ButtonThumbs.ButtonType) {
        switch type {
        case .up:
            iconImage.image = UIImage(named: "hands_up")
        case .down:
            iconImage.image = UIImage(named: "hands_down")
        }
    }
    
    private func initViews() {
        
        self.addSubview(iconImage)
        iconImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        iconImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        iconImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        iconImage.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -5).isActive = true
        
        self.addSubview(labelCount)
        labelCount.leftAnchor.constraint(equalTo: iconImage.rightAnchor, constant: 10).isActive = true
        labelCount.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        
        self.addSubview(button)
        self.addConstraintsWithFormat(format: "H:|[v0]|", views: button)
        self.addConstraintsWithFormat(format: "V:|[v0]|", views: button)
    }

}
