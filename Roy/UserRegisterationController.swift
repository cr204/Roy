//
//  UserRegisterationController.swift
//  Roy
//
//  Created by Jasur Rajabov on 12/14/19.
//  Copyright © 2019 Jasur Rajabov. All rights reserved.
//

import UIKit

class UserRegisterationController: UIViewController {
    
    var topSafeArea: CGFloat = 0
    var bottomSafeArea: CGFloat = 0
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "REGISTER"
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
    
    let nameTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Display Name"
        tf.setLeftPaddingPoints(10)
        tf.textColor = Colors.appBlack
        tf.backgroundColor = Colors.tfBG
        tf.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
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
    
    let passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.setLeftPaddingPoints(10)
        tf.textColor = Colors.appBlack
        tf.backgroundColor = Colors.tfBG
        tf.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let btnRegister: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 3
        btn.setTitle("REGISTER", for: .normal)
        btn.backgroundColor = Colors.btnBgColor
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let labelAgree: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = Colors.appBlack
        label.text = "By creating an account you agree with our"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let btnPrivacy: UIButton = {
        let btn = UIButton()
        btn.setTitle("Privacy Policy", for: .normal)
        btn.setTitleColor(Colors.appBlack, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let labelBottom: UILabel = {
        let label = UILabel()
        label.textColor = Colors.appBlack
        label.text = "Already have an account?"
        label.contentMode = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let btnLogin: UIButton = {
        let btn = UIButton()
        btn.setTitle("LOGIN", for: .normal)
        btn.setTitleColor(Colors.appBlack, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
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
            bottomSafeArea = view.safeAreaInsets.bottom
        } else {
            topSafeArea = topLayoutGuide.length
            bottomSafeArea = bottomLayoutGuide.length
        }
    }

    private func initViews() {
        
        view.addSubview(titleLabel)
        NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 0.2, constant: 0).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        view.addSubview(logoImage)
        logoImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        NSLayoutConstraint(item: logoImage, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: logoImage, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        view.addSubview(nameTF)
        nameTF.widthAnchor.constraint(equalToConstant: 270).isActive = true
        nameTF.heightAnchor.constraint(equalToConstant: 42).isActive = true
        NSLayoutConstraint(item: nameTF, attribute: .top, relatedBy: .equal, toItem: logoImage, attribute: .bottom, multiplier: 1, constant: 25).isActive = true
        NSLayoutConstraint(item: nameTF, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        view.addSubview(emailTF)
        emailTF.widthAnchor.constraint(equalToConstant: 270).isActive = true
        emailTF.heightAnchor.constraint(equalToConstant: 42).isActive = true
        NSLayoutConstraint(item: emailTF, attribute: .top, relatedBy: .equal, toItem: nameTF, attribute: .bottom, multiplier: 1, constant: 15).isActive = true
        NSLayoutConstraint(item: emailTF, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        view.addSubview(passwordTF)
        passwordTF.widthAnchor.constraint(equalToConstant: 270).isActive = true
        passwordTF.heightAnchor.constraint(equalToConstant: 42).isActive = true
        NSLayoutConstraint(item: passwordTF, attribute: .top, relatedBy: .equal, toItem: emailTF, attribute: .bottom, multiplier: 1, constant: 15).isActive = true
        NSLayoutConstraint(item: passwordTF, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
     
        view.addSubview(btnRegister)
        btnRegister.widthAnchor.constraint(equalToConstant: 180).isActive = true
        btnRegister.heightAnchor.constraint(equalToConstant: 50).isActive = true
        NSLayoutConstraint(item: btnRegister, attribute: .top, relatedBy: .equal, toItem: passwordTF, attribute: .bottom, multiplier: 1, constant: 15).isActive = true
        NSLayoutConstraint(item: btnRegister, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        btnRegister.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        
        view.addSubview(labelAgree)
        labelAgree.leftAnchor.constraint(equalTo: emailTF.leftAnchor, constant: 0).isActive = true
        labelAgree.rightAnchor.constraint(equalTo: emailTF.rightAnchor, constant: 0).isActive = true
        NSLayoutConstraint(item: labelAgree, attribute: .top, relatedBy: .equal, toItem: btnRegister, attribute: .bottom, multiplier: 1, constant: 7).isActive = true
        
        view.addSubview(btnPrivacy)
        NSLayoutConstraint(item: btnPrivacy, attribute: .top, relatedBy: .equal, toItem: labelAgree, attribute: .bottom, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: btnPrivacy, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        btnPrivacy.addTarget(self, action: #selector(onPrivacyTapped), for: .touchUpInside)
        
        view.addSubview(labelBottom)
        NSLayoutConstraint(item: labelBottom, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0 - bottomSafeArea - 20).isActive = true
        labelBottom.leftAnchor.constraint(equalTo: emailTF.leftAnchor, constant: 0).isActive = true
        
        view.addSubview(btnLogin)
        NSLayoutConstraint(item: btnLogin, attribute: .centerY, relatedBy: .equal, toItem: labelBottom, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: btnLogin, attribute: .right, relatedBy: .equal, toItem: emailTF, attribute: .right, multiplier: 1, constant: -20).isActive = true
        btnLogin.addTarget(self, action: #selector(onLoginTapped), for: .touchUpInside)
        
    }
    
    @objc private func onButtonTapped(sender: UIButton) {
        let viewController = HomeViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func onLoginTapped(sender: UIButton) {
        let viewController = UserLoginController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func onPrivacyTapped(sender: UIButton) {
        let viewController = PrivacyController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
