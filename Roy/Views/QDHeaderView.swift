//
//  QDHeaderView.swift
//  Roy
//
//  Created by Jasur Rajabov on 1/25/20.
//  Copyright © 2020 Jasur Rajabov. All rights reserved.
//

import UIKit

class QDHeaderView: UIView {
    
    let title: UILabel = {
        let label = UILabel()
        label.textColor = Colors.appBlack
        label.text = "QUESTIONS"
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func initViews() {
        
        self.backgroundColor = Colors.bgColor
        
        self.addSubview(title)
        title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
}
