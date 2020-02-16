//
//  HistoryQeustionsController.swift
//  Roy
//
//  Created by Jasur Rajabov on 1/24/20.
//  Copyright © 2020 Jasur Rajabov. All rights reserved.
//

import UIKit

class HistoryQeustionsController: BaseController, UITableViewDelegate, UITableViewDataSource {
    
    var categoryId: Int = 0
    var questions: [QuestionItem] = []
    
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
        
        self.fetchQuestionList(categoryId: self.categoryId)
        //self.setupViews()
    }
    
    func setupViews() {
        
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
        return  questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryQuestionsCell", for: indexPath) as! HistoryQuestionsCell
        cell.selectionStyle = .none
        cell.labelQuestion.text = questions[indexPath.row].q_title
        cell.labelDate.text = convertToDate(date: questions[indexPath.row].createdAt)
        cell.btnUp.labelCount.text = String(questions[indexPath.row].upvotes)
        cell.btnDown.labelCount.text = String(questions[indexPath.row].downvotes)
        cell.setupViews()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = QuestionDetailsController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    // MARK: Other methods
    
    private func convertToDate(date: Int64) -> String {
        let dateString = String(date)
        return dateString
    }

}


