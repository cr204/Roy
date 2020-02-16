//
//  BaseController.swift
//  Roy
//
//  Created by Jasur Rajabov on 12/15/19.
//  Copyright © 2019 Jasur Rajabov. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
    
    var topSafeArea: CGFloat = 0
    var bottomSafeArea: CGFloat = 0
    
    let btnBack: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "btn_back"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    let logoImage: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "logo_top")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()

    let btnProfile: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "menu_icon"), for: .normal)
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

    func initViews() {
        
        view.addSubview(btnBack)
        NSLayoutConstraint(item: btnBack, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 25 + topSafeArea).isActive = true
        NSLayoutConstraint(item: btnBack, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 12).isActive = true
        btnBack.addTarget(self, action: #selector(onBackTapped), for: .touchUpInside)
        
        view.addSubview(logoImage)
        logoImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        NSLayoutConstraint(item: logoImage, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 20 + topSafeArea).isActive = true
        NSLayoutConstraint(item: logoImage, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        view.addSubview(btnProfile)
        btnProfile.widthAnchor.constraint(equalToConstant: 40).isActive = true
        NSLayoutConstraint(item: btnProfile, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 25 + topSafeArea).isActive = true
        NSLayoutConstraint(item: btnProfile, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 0).isActive = true
        btnProfile.addTarget(self, action: #selector(onProfileTapped), for: .touchUpInside)
        
    }
    
    
    
    
    @objc private func onProfileTapped(sender: UIButton) {
        print("onProfileTapped()")
    }

    @objc private func onBackTapped(sender: UIButton) {
         navigationController?.popViewController(animated: true)
    }

    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel) {
            (result : UIAlertAction) -> Void in
            
        }
        alertController.addAction(okAction)
        
        DispatchQueue.main.async {
            self.navigationController?.present(alertController, animated: true, completion: nil)
        }
    }
    
}
