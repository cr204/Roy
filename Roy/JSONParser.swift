//
//  JSONParser.swift
//  Roy
//
//  Created by Jasur Rajabov on 2/16/20.
//  Copyright © 2020 Jasur Rajabov. All rights reserved.
//

import Foundation

class JSONParser: NSObject {

    private var parserSuccessHandler: ((SuccessData) -> Void)?
    private var parserCategoryListDataHandler: ((CategoryListData) -> Void)?
    private var parserQuestionListHandler: ((QuestionListData) -> Void)?
    
    func parseCategoryList(url: String, completionHandler: ((CategoryListData) -> Void)?) {
        self.parserCategoryListDataHandler = completionHandler
        
        print("JSONParser.categoryList: \(url)")
        let token = Globals.token
        let urlComp = NSURLComponents(string: url)!
        var request = URLRequest(url: urlComp.url!)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        
         URLSession.shared.dataTask(with: request) { (data, resoponse, error) in
                    
            if let error = error {
                print(error)
            }
            
            guard let data = data else { return }
//            let dataAsString = String(data: data, encoding: .utf8)!
//            print("________DATA___________")
//            print(dataAsString)

            do {
                // Swift 4
                let item = try JSONDecoder().decode(CategoryListData.self, from: data)
//                print(item.message[0])
                
                self.parserCategoryListDataHandler?(item)
            } catch let jsonErr {
                print("Error serializing json: ", jsonErr)
            }
            
        }.resume()

    }
    
    
    func parsePostQuestion(url: String, title: String, question: String, categoryId: Int, completeHandler: ((SuccessData) -> Void)?) {
        self.parserSuccessHandler = completeHandler
        print("JSONParser.parsePostQuestion: \(url)")
        
        let token = Globals.token
        let data : Data = "u_id=\(Globals.u_id)&category_id=\(categoryId)&q_title=\(title)&question_desc=\(question)".data(using: .utf8)!
        
        let urlComp = NSURLComponents(string: url)!
        var request = URLRequest(url: urlComp.url!)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type");
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpBody = data
        
        URLSession.shared.dataTask(with: request) { (data, resoponse, error) in
                    
            if let error = error {
                print(error)
            }
            
            guard let data = data else { return }
            do {
                let item = try JSONDecoder().decode(SuccessData.self, from: data)
                self.parserSuccessHandler?(item)
            } catch let jsonErr {
                print("Error serializing json: ", jsonErr)
            }
            
        }.resume()
        
    }
    
    func parseQuestionList(url: String, completeHandler: ((QuestionListData) -> Void)?) {
        self.parserQuestionListHandler = completeHandler
        
        print("JSONParser.questionList: \(url)")
        let token = Globals.token
        let urlComp = NSURLComponents(string: url)!
        urlComp.queryItems = [
            URLQueryItem(name: "u_id", value: Globals.u_id)
        ]
        
        var request = URLRequest(url: urlComp.url!)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, resoponse, error) in
                    
            if let error = error {
                print(error)
            }
            
            guard let data = data else { return }
//            let dataAsString = String(data: data, encoding: .utf8)!
//            print("________DATA___________")
//            print(dataAsString)

            do {
                // Swift 4
                let item = try JSONDecoder().decode(QuestionListData.self, from: data)
//                print(item.message[0])
                
                self.parserQuestionListHandler?(item)
            } catch let jsonErr {
                print("Error serializing json: ", jsonErr)
            }
            
        }.resume()
        
    }

}
