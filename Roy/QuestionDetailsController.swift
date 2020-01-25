//
//  QuestionDetailsController.swift
//  Roy
//
//  Created by Jasur Rajabov on 1/25/20.
//  Copyright © 2020 Jasur Rajabov. All rights reserved.
//

import UIKit

class QuestionDetailsController: BaseController, UITableViewDataSource, UITableViewDelegate {
    
    let answers = [String]()
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.backgroundColor = UIColor.clear
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(QuestionTVCell.self, forCellReuseIdentifier: "QuestionCell")
        tableView.register(AnswerCell.self, forCellReuseIdentifier: "AnswerCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        self.setupViews()
    }
    
    func setupViews() {
        
        view.addSubview(tableView)
        view.addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: tableView)
        view.addConstraintsWithFormat(format: "V:|-75-[v0]-10-|", views: tableView)
        //NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: labelTitle, attribute: .bottom, multiplier: 1, constant: 10).isActive = true
        //NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -10).isActive = true
        
    }
    
    
    // MARK: TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = QDHeaderView()
        header.title.text = section == 0 ? "QUESTIONS" : "ANSWERS"
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionTVCell
            cell.setupViews()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath) as! AnswerCell
            cell.setupViews()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    



}



