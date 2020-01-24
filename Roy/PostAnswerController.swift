//
//  PostAnswerController.swift
//  Roy
//
//  Created by Jasur Rajabov on 1/23/20.
//  Copyright © 2020 Jasur Rajabov. All rights reserved.
//

import UIKit

class PostAnswerController: BaseController, UITextViewDelegate {
    
    let labelQuestions: UILabel = {
        let label = UILabel()
        label.text = "QUIESTIONS"
        label.textColor = Colors.appBlack
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelSubtitle: UILabel = {
        let label = UILabel()
        label.text = "Why is sky blue?"
        label.textColor = Colors.appBlack
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelQuestionBody: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = Colors.appBlack
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelAnswers: UILabel = {
        let label = UILabel()
        label.text = "ANSWERS"
        label.textColor = Colors.appBlack
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
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

        // Do any additional setup after loading the view.
        self.setupViews()
    }
    

    private func setupViews() {
    
        view.addSubview(labelQuestions)
        NSLayoutConstraint(item: labelQuestions, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 100).isActive = true
        NSLayoutConstraint(item: labelQuestions, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 15).isActive = true
        
        view.addSubview(labelSubtitle)
        NSLayoutConstraint(item: labelSubtitle, attribute: .left, relatedBy: .equal, toItem: labelQuestions, attribute: .left, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: labelSubtitle, attribute: .top, relatedBy: .equal, toItem: labelQuestions, attribute: .bottom, multiplier: 1, constant: 15).isActive = true
        
        view.addSubview(labelQuestionBody)
        view.addConstraintsWithFormat(format: "H:|-15-[v0]-15-|", views: labelQuestionBody)
        NSLayoutConstraint(item: labelQuestionBody, attribute: .top, relatedBy: .equal, toItem: labelSubtitle, attribute: .bottom, multiplier: 1, constant: 10).isActive = true
        
        view.addSubview(labelAnswers)
        NSLayoutConstraint(item: labelAnswers, attribute: .top, relatedBy: .equal, toItem: labelQuestionBody, attribute: .bottom, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: labelAnswers, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 15).isActive = true
        
        view.addSubview(detailsTF)
        detailsTF.heightAnchor.constraint(equalToConstant: 200).isActive = true
        view.addConstraintsWithFormat(format: "H:|-15-[v0]-15-|", views: detailsTF)
        NSLayoutConstraint(item: detailsTF, attribute: .top, relatedBy: .equal, toItem: labelAnswers, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        
        view.addSubview(btnPost)
        btnPost.widthAnchor.constraint(equalToConstant: 240).isActive = true
        btnPost.heightAnchor.constraint(equalToConstant: 50).isActive = true
        NSLayoutConstraint(item: btnPost, attribute: .top, relatedBy: .equal, toItem: detailsTF, attribute: .bottom, multiplier: 1, constant: 30).isActive = true
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
      
    }
    

}
