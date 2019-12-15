//
//  ForgotPasswordController.swift
//  Roy
//
//  Created by Jasur Rajabov on 12/15/19.
//  Copyright © 2019 Jasur Rajabov. All rights reserved.
//

import UIKit

class ForgotPasswordController: UIViewController {

    var topSafeArea: CGFloat = 0
    
    let btnBack: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "btn_back"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "FORGET PASSWORD"
        label.textColor = Colors.appBlack
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let logoImage: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "logo_top")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let emailTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.setLeftPaddingPoints(10)
        tf.textColor = Colors.appBlack
        tf.backgroundColor = Colors.tfBG
        tf.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let btnReset: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 3
        btn.setTitle("RESET", for: .normal)
        btn.backgroundColor = Colors.btnBgColor
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.bgColor
            
        self.initViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if #available(iOS 11.0, *) {
            topSafeArea = view.safeAreaInsets.top
        } else {
            topSafeArea = topLayoutGuide.length
        }
    }

    private func initViews() {
        
        view.addSubview(btnBack)
        NSLayoutConstraint(item: btnBack, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 25 + topSafeArea).isActive = true
        NSLayoutConstraint(item: btnBack, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 12).isActive = true
        btnBack.addTarget(self, action: #selector(onBackTapped), for: .touchUpInside)
        
        view.addSubview(titleLabel)
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 0.2, constant: 0).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        view.addSubview(logoImage)
        logoImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        NSLayoutConstraint(item: logoImage, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: logoImage, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        view.addSubview(emailTF)
        emailTF.widthAnchor.constraint(equalToConstant: 270).isActive = true
        emailTF.heightAnchor.constraint(equalToConstant: 42).isActive = true
        NSLayoutConstraint(item: emailTF, attribute: .top, relatedBy: .equal, toItem: logoImage, attribute: .bottom, multiplier: 1, constant: 25).isActive = true
        NSLayoutConstraint(item: emailTF, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        view.addSubview(btnReset)
        btnReset.widthAnchor.constraint(equalToConstant: 180).isActive = true
        btnReset.heightAnchor.constraint(equalToConstant: 50).isActive = true
        NSLayoutConstraint(item: btnReset, attribute: .top, relatedBy: .equal, toItem: emailTF, attribute: .bottom, multiplier: 1, constant: 15).isActive = true
        NSLayoutConstraint(item: btnReset, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        btnReset.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
    }
    
    @objc private func onButtonTapped(sender: UIButton) {
        print("onResetTapped!")
    }
    
    @objc private func onBackTapped(sender: UIButton) {
         _=navigationController?.popViewController(animated: true)
    }
    
}
