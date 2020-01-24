//
//  AskQuestionController.swift
//  Roy
//
//  Created by Jasur Rajabov on 1/23/20.
//  Copyright © 2020 Jasur Rajabov. All rights reserved.
//

import UIKit

class AskQuestionController: BaseController, UITextViewDelegate {
    
    let labelPost: UILabel = {
        let label = UILabel()
        label.text = "POST"
        label.textColor = Colors.appBlack
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter Question"
        tf.setLeftPaddingPoints(10)
        tf.textColor = Colors.appBlack
        tf.backgroundColor = Colors.tfBG
        tf.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let labelCategory: UILabel = {
        let label = UILabel()
        label.textColor = Colors.appBlack
        label.text = "Category:"
        label.contentMode = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelCategoryName: UILabel = {
        let label = UILabel()
        label.textColor = Colors.appBlack
        label.text = "Relationship"
        label.contentMode = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let detailsTF: UITextView = {
        let tf = UITextView()
        tf.text = "Enter Details"
        tf.textColor = UIColor.lightGray
        tf.textContainerInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        tf.backgroundColor = Colors.tfBG
        tf.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    
    let btnPost: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 3
        btn.setTitle("POST", for: .normal)
        btn.backgroundColor = Colors.btnBgColor
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsTF.delegate = self
        self.setupViews()
    }
    

    private func setupViews() {
        
        view.addSubview(labelPost)
        NSLayoutConstraint(item: labelPost, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 100).isActive = true
        NSLayoutConstraint(item: labelPost, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 15).isActive = true
        
        view.addSubview(nameTF)
        nameTF.heightAnchor.constraint(equalToConstant: 42).isActive = true
        view.addConstraintsWithFormat(format: "H:|-15-[v0]-15-|", views: nameTF)
        NSLayoutConstraint(item: nameTF, attribute: .top, relatedBy: .equal, toItem: labelPost, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        
        view.addSubview(labelCategory)
        NSLayoutConstraint(item: labelCategory, attribute: .top, relatedBy: .equal, toItem: nameTF, attribute: .bottom, multiplier: 1, constant: 17).isActive = true
        NSLayoutConstraint(item: labelCategory, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 15).isActive = true
        
        view.addSubview(labelCategoryName)
        NSLayoutConstraint(item: labelCategoryName, attribute: .bottom, relatedBy: .equal, toItem: labelCategory, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: labelCategoryName, attribute: .left, relatedBy: .equal, toItem: labelCategory, attribute: .right, multiplier: 1, constant: 3).isActive = true
        
        view.addSubview(detailsTF)
        detailsTF.heightAnchor.constraint(equalToConstant: 200).isActive = true
        view.addConstraintsWithFormat(format: "H:|-15-[v0]-15-|", views: detailsTF)
        NSLayoutConstraint(item: detailsTF, attribute: .top, relatedBy: .equal, toItem: labelCategory, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        
        view.addSubview(btnPost)
        btnPost.widthAnchor.constraint(equalToConstant: 240).isActive = true
        btnPost.heightAnchor.constraint(equalToConstant: 50).isActive = true
        NSLayoutConstraint(item: btnPost, attribute: .top, relatedBy: .equal, toItem: detailsTF, attribute: .bottom, multiplier: 1, constant: 70).isActive = true
        NSLayoutConstraint(item: btnPost, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        btnPost.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        
    }
    
    // MARK: TextView
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = Colors.appBlack
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Enter Details"
            textView.textColor = UIColor.lightGray
        }
    }
    
    
    @objc private func onButtonTapped(sender: UIButton) {
        print("onButtonTapped()")
        
        var viewController = PostAnswerController()
        navigationController?.pushViewController(viewController, animated: true)
    }

}
