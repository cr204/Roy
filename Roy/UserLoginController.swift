//
//  UserLoginController.swift
//  Roy
//
//  Created by Jasur Rajabov on 12/15/19.
//  Copyright © 2019 Jasur Rajabov. All rights reserved.
//

import UIKit

class UserLoginController: UIViewController {

    var topSafeArea: CGFloat = 0
    var bottomSafeArea: CGFloat = 0
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "LOGIN"
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
    
    let btnLogin: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 3
        btn.setTitle("LOGIN", for: .normal)
        btn.backgroundColor = Colors.btnBgColor
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let btnForget: UIButton = {
        let btn = UIButton()
        btn.setTitle("Forget Password", for: .normal)
        btn.setTitleColor(Colors.appBlack, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let labelBottom: UILabel = {
        let label = UILabel()
        label.textColor = Colors.appBlack
        label.text = "Don't have account?"
        label.contentMode = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let btnRegister: UIButton = {
        let btn = UIButton()
        btn.setTitle("REGISTER", for: .normal)
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
        
        view.addSubview(emailTF)
        emailTF.widthAnchor.constraint(equalToConstant: 270).isActive = true
        emailTF.heightAnchor.constraint(equalToConstant: 42).isActive = true
        NSLayoutConstraint(item: emailTF, attribute: .top, relatedBy: .equal, toItem: logoImage, attribute: .bottom, multiplier: 1, constant: 25).isActive = true
        NSLayoutConstraint(item: emailTF, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        view.addSubview(passwordTF)
        passwordTF.widthAnchor.constraint(equalToConstant: 270).isActive = true
        passwordTF.heightAnchor.constraint(equalToConstant: 42).isActive = true
        NSLayoutConstraint(item: passwordTF, attribute: .top, relatedBy: .equal, toItem: emailTF, attribute: .bottom, multiplier: 1, constant: 15).isActive = true
        NSLayoutConstraint(item: passwordTF, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        view.addSubview(btnLogin)
        btnLogin.widthAnchor.constraint(equalToConstant: 180).isActive = true
        btnLogin.heightAnchor.constraint(equalToConstant: 50).isActive = true
        NSLayoutConstraint(item: btnLogin, attribute: .top, relatedBy: .equal, toItem: passwordTF, attribute: .bottom, multiplier: 1, constant: 15).isActive = true
        NSLayoutConstraint(item: btnLogin, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        btnLogin.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        
        view.addSubview(btnForget)
        NSLayoutConstraint(item: btnForget, attribute: .top, relatedBy: .equal, toItem: btnLogin, attribute: .bottom, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: btnForget, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        btnForget.addTarget(self, action: #selector(onForgetTapped), for: .touchUpInside)
        
        view.addSubview(labelBottom)
        NSLayoutConstraint(item: labelBottom, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0 - bottomSafeArea - 20).isActive = true
        labelBottom.leftAnchor.constraint(equalTo: emailTF.leftAnchor, constant: 0).isActive = true
        
        view.addSubview(btnRegister)
        NSLayoutConstraint(item: btnRegister, attribute: .centerY, relatedBy: .equal, toItem: labelBottom, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: btnRegister, attribute: .right, relatedBy: .equal, toItem: emailTF, attribute: .right, multiplier: 1, constant: -20).isActive = true
        btnRegister.addTarget(self, action: #selector(onRegisterTapped), for: .touchUpInside)
        
    }
    
    @objc private func onForgetTapped(sender: UIButton) {
        let viewController = ForgotPasswordController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func onButtonTapped(sender: UIButton) {
        print("onLoginTapped!")
    }
    
    @objc private func onRegisterTapped(sender: UIButton) {
        let viewController = UserRegisterationController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
