//
//  HistoryQeustionsController.swift
//  Roy
//
//  Created by Jasur Rajabov on 1/24/20.
//  Copyright © 2020 Jasur Rajabov. All rights reserved.
//

import UIKit

class HistoryQeustionsController: BaseController, UITableViewDelegate, UITableViewDataSource {
    
    let labelTitle: UILabel = {
        let label = UILabel()
        label.text = "CATEGORY TITLE"
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

        tableView.register(HistoryQuestionsCell.self, forCellReuseIdentifier: "HistoryQuestionsCell")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryQuestionsCell", for: indexPath) as! HistoryQuestionsCell
        cell.selectionStyle = .none
        cell.setupViews()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let viewController = PostAnswerController()
        navigationController?.pushViewController(viewController, animated: true)
    }

}



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
        btn.set(type: .up)
        btn.labelCount.text = "5"
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let btnDown: ButtonThumbs = {
        let btn = ButtonThumbs()
        btn.set(type: .down)
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


