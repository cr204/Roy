//
//  HistoryQuestionsCell.swift
//  Roy
//
//  Created by Jasur Rajabov on 1/25/20.
//  Copyright © 2020 Jasur Rajabov. All rights reserved.
//

import UIKit

class HistoryQuestionsCell: UITableViewCell {
    
    private let bgView: BGVIew = {
        let view = BGVIew()
        view.layer.cornerRadius = 3
        view.backgroundColor = UIColor(red: 0.87, green: 0.83, blue: 0.66, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let labelQuestion: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = "How to wake up early in the morning?"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelDate: UILabel = {
        let label = UILabel()
        label.textColor = Colors.gray
        label.text = "-September 2, 2019"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
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
        btn.tag = 0
        btn.set(type: .up, color: .gray)
        btn.labelCount.text = "5"
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let btnDown: ButtonThumbs = {
        let btn = ButtonThumbs()
        btn.tag = 1
        btn.set(type: .down, color: .gray)
        btn.labelCount.text = "0"
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func setupViews() {
        self.backgroundColor = UIColor.clear
        
        self.addSubview(bgView)
        self.addConstraintsWithFormat(format: "H:|-15-[v0]-15-|", views: bgView)
        bgView.heightAnchor.constraint(equalToConstant: 112).isActive = true
        NSLayoutConstraint(item: bgView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        bgView.addSubview(labelQuestion)
        NSLayoutConstraint(item: labelQuestion, attribute: .left, relatedBy: .equal, toItem: bgView, attribute: .left, multiplier: 1, constant: 12).isActive = true
        NSLayoutConstraint(item: labelQuestion, attribute: .top, relatedBy: .equal, toItem: bgView, attribute: .top, multiplier: 1, constant: 15).isActive = true
        
        bgView.addSubview(labelDate)
        NSLayoutConstraint(item: labelDate, attribute: .top, relatedBy: .equal, toItem: labelQuestion, attribute: .bottom, multiplier: 1, constant: 2).isActive = true
        NSLayoutConstraint(item: labelDate, attribute: .left, relatedBy: .equal, toItem: labelQuestion, attribute: .left, multiplier: 1, constant: 0).isActive = true
        
        bgView.addSubview(separator)
        bgView.addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: separator)
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        NSLayoutConstraint(item: separator, attribute: .top, relatedBy: .equal, toItem: labelDate, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        
        self.addSubview(btnUp)
        btnUp.widthAnchor.constraint(equalToConstant: 50).isActive = true
        btnUp.heightAnchor.constraint(equalToConstant: 30).isActive = true
        NSLayoutConstraint(item: btnUp, attribute: .left, relatedBy: .equal, toItem: separator, attribute: .left, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: btnUp, attribute: .top, relatedBy: .equal, toItem: separator, attribute: .bottom, multiplier: 1, constant: 3).isActive = true
        
        self.addSubview(btnDown)
        btnDown.widthAnchor.constraint(equalToConstant: 50).isActive = true
        btnDown.heightAnchor.constraint(equalToConstant: 30).isActive = true
        NSLayoutConstraint(item: btnDown, attribute: .right, relatedBy: .equal, toItem: separator, attribute: .right, multiplier: 1, constant: -3).isActive = true
        NSLayoutConstraint(item: btnDown, attribute: .top, relatedBy: .equal, toItem: separator, attribute: .bottom, multiplier: 1, constant: 3).isActive = true
        
    }
    
}

