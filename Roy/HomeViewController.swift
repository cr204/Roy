//
//  HomeViewController.swift
//  Roy
//
//  Created by Jasur Rajabov on 12/15/19.
//  Copyright © 2019 Jasur Rajabov. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6Ik9VRXhRVFF4UWtNNU5qa3hOVVZGTmtJM1F6Z3hSRUk1UWpjMFFUWkVSVUZDUlRsR05USTNNZyJ9.eyJpc3MiOiJodHRwczovL3JveWFwaS5hdXRoMC5jb20vIiwic3ViIjoiZm1QcEVFb0FNSkdyaUpZSDVoVllyNXBLdmVjZ3JRWXNAY2xpZW50cyIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Qvcm95YXBpIiwiaWF0IjoxNTcwNTQxMjAwLCJleHAiOjE1NzA2Mjc2MDAsImF6cCI6ImZtUHBFRW9BTUpHcmlKWUg1aFZZcjVwS3ZlY2dyUVlzIiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIn0.IBAmWtQ3GG6P8QvOjS3BTuo3Hw0L9Y9enIJ46WuHTGn1oIt25nnjNkn1bCTTFxNicT8HVPuNUVKBawOeCKYJ8vN5P9wfZSKmEzL5DXhFG9VZ5f5FEQCOM_M-pS4WkCstTPC_8unAvRSjrwoi3w3NrKY8u-kz6hmSrMjXPbDvo1w8T__-zGgNnbg415SqdSTC-PRMvUgJJ9mO7s4q8bb6Myi0XjU6BG0zs9eqQ0rWsMfHZeSewXTBhQQBEmu601BJ3zCMr1Li8_aBfqXMyWpnMBrDoOF4H3K4gYPKxC1z3QPz415FydtK-mIwVR4SKXlQiPqvBlsTUupreJPTGN6zkg"
    let u_id = "EgJ78mEpgKPP0clRderUqLgmXR33"
    
    var topSafeArea: CGFloat = 0
    var bottomSafeArea: CGFloat = 0
    
    let btnAnswers: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "customer"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let btnProfile: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "menu_icon"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let logoImage: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "logo_top")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let btnAsk: UIButton = {
        let btn = UIButton()
        btn.tag = 0
        btn.layer.cornerRadius = 3
        btn.setTitle("ASK ROY", for: .normal)
        btn.backgroundColor = Colors.btnBgColor
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let viewAsk: AnswerView = {
        let view = AnswerView()
        view.label.text = "1"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let btnHelp: UIButton = {
        let btn = UIButton()
        btn.tag = 1
        btn.layer.cornerRadius = 3
        btn.setTitle("HELP ROY", for: .normal)
        btn.backgroundColor = Colors.btnBgColor
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let viewHelp: AnswerView = {
        let view = AnswerView()
        view.label.text = "2"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let btnHistory: UIButton = {
        let btn = UIButton()
        btn.tag = 2
        btn.layer.cornerRadius = 3
        btn.setTitle("HISTORY", for: .normal)
        btn.backgroundColor = Colors.btnBgColor
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let labelBottom: UILabel = {
        let label = UILabel()
        label.textColor = Colors.appBlack
        label.text = "In urgent need of help?"
        label.contentMode = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let btnClick: UIButton = {
        let btn = UIButton()
        btn.setTitle("Click here", for: .normal)
        btn.setTitleColor(Colors.appBlack, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let labelBottom1: UILabel = {
        let label = UILabel()
        label.textColor = Colors.appBlack
        label.text = "Roy has helped "
        label.contentMode = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let btnBottom: UIButton = {
        let btn = UIButton()
        btn.setTitle("20", for: .normal)
        btn.setTitleColor(Colors.appBlack, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Globals.token = self.token
        Globals.u_id = self.u_id

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
        
        view.addSubview(btnAnswers)
        NSLayoutConstraint(item: btnAnswers, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 25 + topSafeArea).isActive = true
        NSLayoutConstraint(item: btnAnswers, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 12).isActive = true
        btnAnswers.addTarget(self, action: #selector(onAnswersTapped), for: .touchUpInside)
        
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
        
        view.addSubview(btnAsk)
        btnAsk.widthAnchor.constraint(equalToConstant: 240).isActive = true
        btnAsk.heightAnchor.constraint(equalToConstant: 50).isActive = true
        NSLayoutConstraint(item: btnAsk, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 0.8, constant: 0).isActive = true
        NSLayoutConstraint(item: btnAsk, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        btnAsk.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        
        view.addSubview(viewAsk)
        NSLayoutConstraint(item: viewAsk, attribute: .left, relatedBy: .equal, toItem: btnAsk, attribute: .right, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: viewAsk, attribute: .top, relatedBy: .equal, toItem: btnAsk, attribute: .top, multiplier: 1, constant: -40).isActive = true
        
        view.addSubview(btnHelp)
        btnHelp.widthAnchor.constraint(equalToConstant: 240).isActive = true
        btnHelp.heightAnchor.constraint(equalToConstant: 50).isActive = true
        NSLayoutConstraint(item: btnHelp, attribute: .top, relatedBy: .equal, toItem: btnAsk, attribute: .bottom, multiplier: 1, constant: 40).isActive = true
        NSLayoutConstraint(item: btnHelp, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        btnHelp.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        
        view.addSubview(viewHelp)
        NSLayoutConstraint(item: viewHelp, attribute: .left, relatedBy: .equal, toItem: btnHelp, attribute: .right, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: viewHelp, attribute: .top, relatedBy: .equal, toItem: btnHelp, attribute: .top, multiplier: 1, constant: -40).isActive = true
        
        view.addSubview(btnHistory)
        btnHistory.widthAnchor.constraint(equalToConstant: 240).isActive = true
        btnHistory.heightAnchor.constraint(equalToConstant: 50).isActive = true
        NSLayoutConstraint(item: btnHistory, attribute: .top, relatedBy: .equal, toItem: btnHelp, attribute: .bottom, multiplier: 1, constant: 40).isActive = true
        NSLayoutConstraint(item: btnHistory, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        btnHistory.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        
        view.addSubview(labelBottom)
        NSLayoutConstraint(item: labelBottom, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0 - bottomSafeArea - 40).isActive = true
        labelBottom.leftAnchor.constraint(equalTo: btnAsk.leftAnchor, constant: 0).isActive = true
        
        view.addSubview(btnClick)
        NSLayoutConstraint(item: btnClick, attribute: .centerY, relatedBy: .equal, toItem: labelBottom, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: btnClick, attribute: .left, relatedBy: .equal, toItem: labelBottom, attribute: .right, multiplier: 1, constant: 5).isActive = true
        btnClick.addTarget(self, action: #selector(onUrgentHelpTapped), for: .touchUpInside)
        
        view.addSubview(labelBottom1)
        NSLayoutConstraint(item: labelBottom1, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0 - bottomSafeArea - 20).isActive = true
        labelBottom1.leftAnchor.constraint(equalTo: btnAsk.leftAnchor, constant: 50).isActive = true
        
        view.addSubview(btnBottom)
        NSLayoutConstraint(item: btnBottom, attribute: .centerY, relatedBy: .equal, toItem: labelBottom1, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: btnBottom, attribute: .left, relatedBy: .equal, toItem: labelBottom1, attribute: .right, multiplier: 1, constant: 5).isActive = true
        
    }
    
    @objc private func onAnswersTapped(sender: UIButton) {
        print("onAnswersTapped()")
    }
    
    @objc private func onProfileTapped(sender: UIButton) {
        print("onProfileTapped()")
    }
    
    @objc private func onButtonTapped(sender: UIButton) {
        print("onButtonTapped: \(sender.tag)")
        
        //var viewController = UIViewController()
        
        switch sender.tag {
        case 0:
            let viewController = CategoryListController()
            viewController.listCategory = .question
            navigationController?.pushViewController(viewController, animated: true)
        case 1:
            let viewController = HelpViewController()
            navigationController?.pushViewController(viewController, animated: true)
        case 2:
            let viewController = CategoryListController()
            viewController.listCategory = .history
            navigationController?.pushViewController(viewController, animated: true)
        default:
            return
        }
        
        // navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func onUrgentHelpTapped(sender: UIButton) {
        
        
    }
    
}



internal class AnswerView: UIView {
    
    let image: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "group")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textAlignment = .center
        label.textColor = Colors.btnBgColor
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initViews()
    }
    
    private func initViews() {
        
        self.addSubview(image)
        NSLayoutConstraint(item: image, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: image, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0).isActive = true
        
        self.addSubview(label)
        NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: image, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: image, attribute: .centerY, multiplier: 1, constant: -5).isActive = true
        
    }
    
}
