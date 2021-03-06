//
//  HelpViewController.swift
//  Roy
//
//  Created by Jasur Rajabov on 1/23/20.
//  Copyright © 2020 Jasur Rajabov. All rights reserved.
//

import UIKit

class HelpViewController: BaseController, UITableViewDelegate, UITableViewDataSource {
    
    let labelTitle: UILabel = {
        let label = UILabel()
        label.text = "NEED YOUR HELP"
        label.textColor = Colors.appBlack
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.backgroundColor = UIColor.clear
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(HelpCell.self, forCellReuseIdentifier: "HelpCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
        self.setupViews()
    }
    
    private func setupViews() {
        
        view.addSubview(labelTitle)
        NSLayoutConstraint(item: labelTitle, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 100).isActive = true
        NSLayoutConstraint(item: labelTitle, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 15).isActive = true
        
        view.addSubview(tableView)
        view.addConstraintsWithFormat(format: "H:|-0-[v0]-0-|", views: tableView)
        NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: labelTitle, attribute: .bottom, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -10).isActive = true
        
    }
    
    
    // MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HelpCell", for: indexPath) as! HelpCell
        cell.selectionStyle = .none
        cell.setupViews()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let viewController = PostAnswerController()
        navigationController?.pushViewController(viewController, animated: true)
    }

}



class HelpCell: UITableViewCell {
    
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
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelDate: UILabel = {
        let label = UILabel()
        label.textColor = Colors.gray
        label.text = "-September 2, 2019"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageCell: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "help_circle")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    func setupViews() {
        self.backgroundColor = UIColor.clear
        
        self.addSubview(bgView)
        self.addConstraintsWithFormat(format: "H:|-15-[v0]-15-|", views: bgView)
        bgView.heightAnchor.constraint(equalToConstant: 86).isActive = true
        NSLayoutConstraint(item: bgView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        bgView.addSubview(labelQuestion)
        NSLayoutConstraint(item: labelQuestion, attribute: .left, relatedBy: .equal, toItem: bgView, attribute: .left, multiplier: 1, constant: 12).isActive = true
        NSLayoutConstraint(item: labelQuestion, attribute: .top, relatedBy: .equal, toItem: bgView, attribute: .top, multiplier: 1, constant: 24).isActive = true
        
        bgView.addSubview(labelDate)
        NSLayoutConstraint(item: labelDate, attribute: .top, relatedBy: .equal, toItem: labelQuestion, attribute: .bottom, multiplier: 1, constant: 2).isActive = true
        NSLayoutConstraint(item: labelDate, attribute: .left, relatedBy: .equal, toItem: labelQuestion, attribute: .left, multiplier: 1, constant: 0).isActive = true
        
        bgView.addSubview(imageCell)
        imageCell.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imageCell.widthAnchor.constraint(equalToConstant: 40).isActive = true
        NSLayoutConstraint(item: imageCell, attribute: .right, relatedBy: .equal, toItem: bgView, attribute: .right, multiplier: 1, constant: -12).isActive = true
        NSLayoutConstraint(item: imageCell, attribute: .centerY, relatedBy: .equal, toItem: bgView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
    }
    
}

class BGVIew: UIView {
    
    var shadowLayer:CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 7).cgPath
            shadowLayer.fillColor =  UIColor(red: 0.87, green: 0.83, blue: 0.66, alpha: 1).cgColor
            
            shadowLayer.shadowColor = UIColor.gray.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            shadowLayer.shadowOpacity = 0.4
            shadowLayer.shadowRadius = 1
            
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
    
    
}
