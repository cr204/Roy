//
//  HelpViewController.swift
//  Roy
//
//  Created by Jasur Rajabov on 1/23/20.
//  Copyright © 2020 Jasur Rajabov. All rights reserved.
//

import UIKit

class HelpViewController: BaseController {
    
    let labelTitle: UILabel = {
        let label = UILabel()
        label.text = "NEED YOUR HELP"
        label.textColor = Colors.appBlack
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    

}
