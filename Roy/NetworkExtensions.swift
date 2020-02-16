//
//  NetworkExtensions.swift
//  Roy
//
//  Created by Jasur Rajabov on 2/16/20.
//  Copyright © 2020 Jasur Rajabov. All rights reserved.
//

import Foundation

extension CategoryListController {
    
    func fetchCategoryList() {
        let dataParser = JSONParser()
        dataParser.parseCategoryList(url: Links.categoryList) { (listData: CategoryListData) in
            if listData.error {
                print("expenseData.error: \(listData.error)")
            }

            self.categories = listData.message
            OperationQueue.main.addOperation {
                print("CategoryList loaded!")
                self.setupViews()
            }
        }
    }
}



extension AskQuestionController {
    
    func postQuestion(title: String, question: String, categoryId: Int) {
        let dataParser = JSONParser()
        dataParser.parsePostQuestion(url: Links.postQuestion, title: title, question: question, categoryId: categoryId) { (respond: SuccessData) in
            if respond.error {
                self.showAlert(title: "Error!", message: respond.message)
            }
            
            OperationQueue.main.addOperation {
                self.showAlert(title: "Success", message: respond.message)
            }
        }
        
    }
}

extension HistoryQeustionsController {
    
    /**
    Gets question list from server and parse it to QuestionItem array

    - Parameter categoryId: Id number of category

    - Throws: `MyError.invalidRecipient`
              if `recipient` is "Derek"
              (he knows what he did).

    - Returns: A new string saying hello to `recipient`.
    */
    func fetchQuestionList(categoryId: Int) {
        let dataParser = JSONParser()
        dataParser.parseQuestionList(url: Links.questionList) { (respond: QuestionListData) in
            if respond.error {
                self.showAlert(title: "Error", message: "No questions!")
            }
            
            OperationQueue.main.addOperation {
                self.questions = respond.message.filter { $0.category_id == self.categoryId}
                self.setupViews()
            }
        }
    }
}

extension HistoryQuestionsCell {
    
    
    
    
}


    

