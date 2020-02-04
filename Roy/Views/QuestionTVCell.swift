//
//  QuestionTVCell.swift
//  Roy
//
//  Created by Jasur Rajabov on 1/25/20.
//  Copyright © 2020 Jasur Rajabov. All rights reserved.
//

import UIKit

class QuestionTVCell: UITableViewCell {
    
    let title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = Colors.appBlack
        label.text = "Why is the sky blue?"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let body: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = Colors.brown
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt."
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelReport: UILabel = {
        let label = UILabel()
        label.text = "REPORT"
        label.textColor = Colors.brown
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separator: UIView = {
        let view = UIView()
        view.alpha = 0.5
        view.backgroundColor = Colors.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let btnUp: ButtonThumbs = {
        let btn = ButtonThumbs()
        btn.set(type: .up, color: .brown)
        btn.labelCount.text = "5"
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let btnDown: ButtonThumbs = {
        let btn = ButtonThumbs()
        btn.set(type: .down, color: .brown)
        btn.labelCount.text = "5"
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    

    func setupViews() {
        
        self.selectionStyle = .none
        
        self.backgroundColor = UIColor.clear
        
        self.addSubview(title)
        title.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        self.addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: title)
        
        self.addSubview(body)
        self.addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: body)
        NSLayoutConstraint(item: body, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 10).isActive = true
        
        self.addSubview(labelReport)
        NSLayoutConstraint(item: labelReport, attribute: .top, relatedBy: .equal, toItem: body, attribute: .bottom, multiplier: 1, constant: 15).isActive = true
        NSLayoutConstraint(item: labelReport, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0).isActive = true
        
        self.addSubview(separator)
        self.addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: separator)
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        NSLayoutConstraint(item: separator, attribute: .top, relatedBy: .equal, toItem: labelReport, attribute: .bottom, multiplier: 1, constant: 7).isActive = true
        
        self.addSubview(btnUp)
        btnUp.widthAnchor.constraint(equalToConstant: 50).isActive = true
        btnUp.heightAnchor.constraint(equalToConstant: 30).isActive = true
        NSLayoutConstraint(item: btnUp, attribute: .left, relatedBy: .equal, toItem: separator, attribute: .left, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: btnUp, attribute: .top, relatedBy: .equal, toItem: separator, attribute: .bottom, multiplier: 1, constant: 3).isActive = true
        
        self.addSubview(btnDown)
        btnDown.widthAnchor.constraint(equalToConstant: 50).isActive = true
        btnDown.heightAnchor.constraint(equalToConstant: 30).isActive = true
        NSLayoutConstraint(item: btnDown, attribute: .right, relatedBy: .equal, toItem: separator, attribute: .right, multiplier: 1, constant: -13).isActive = true
        NSLayoutConstraint(item: btnDown, attribute: .top, relatedBy: .equal, toItem: separator, attribute: .bottom, multiplier: 1, constant: 3).isActive = true
    }
    
    
    

}
