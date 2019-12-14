//
//  SignUpLoginController.swift
//  Roy
//
//  Created by Jasur Rajabov on 12/14/19.
//  Copyright © 2019 Jasur Rajabov. All rights reserved.
//

import UIKit

class SignUpLoginController: UIViewController {
    
    let logoImage: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "splash_screen_logo")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let btnSignUp: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 3
        btn.setTitle("SIGNUP", for: .normal)
        btn.backgroundColor = Colors.btnBgColor
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
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
    
    let btnGoogle: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 3
        btn.setImage(UIImage(named: "googlelogin"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.bgColor
        
        self.initViews()
    }
    

    private func initViews() {
        
        view.addSubview(logoImage)
        NSLayoutConstraint(item: logoImage, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 0.55, constant: 0).isActive = true
        NSLayoutConstraint(item: logoImage, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        view.addSubview(btnSignUp)
        btnSignUp.widthAnchor.constraint(equalToConstant: 240).isActive = true
        btnSignUp.heightAnchor.constraint(equalToConstant: 50).isActive = true
        NSLayoutConstraint(item: btnSignUp, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.2, constant: 0).isActive = true
        NSLayoutConstraint(item: btnSignUp, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        view.addSubview(btnLogin)
        btnLogin.widthAnchor.constraint(equalToConstant: 240).isActive = true
        btnLogin.heightAnchor.constraint(equalToConstant: 50).isActive = true
        NSLayoutConstraint(item: btnLogin, attribute: .top, relatedBy: .equal, toItem: btnSignUp, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: btnLogin, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        view.addSubview(btnGoogle)
        btnGoogle.widthAnchor.constraint(equalToConstant: 240).isActive = true
        btnGoogle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        NSLayoutConstraint(item: btnGoogle, attribute: .top, relatedBy: .equal, toItem: btnLogin, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: btnGoogle, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        
    }

}
