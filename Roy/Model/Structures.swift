//
//  Structures.swift
//  Roy
//
//  Created by Jasur Rajabov on 2/16/20.
//  Copyright © 2020 Jasur Rajabov. All rights reserved.
//

import UIKit


struct SuccessData: Decodable {
    let error: Bool
    let message: String
}


struct CategoryListData: Decodable {
    let error: Bool
    let message: [CategoryItem]
}

struct CategoryItem: Decodable {
    let category_id: Int
    let category_name: String
}

struct QuestionListData: Decodable {
    let error: Bool
    let message: [QuestionItem]
}

struct QuestionItem: Decodable {
    let post_id: Int
    let q_title: String
    let question_desc: String
    let category_id: Int
    let category_name: String
    let upvotes: Int
    let downvotes: Int
    let createdAt: Int64
    let answered: Int
}
