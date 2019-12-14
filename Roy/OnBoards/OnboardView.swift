//
//  OnboardView.swift
//  Roy
//
//  Created by Jasur Rajabov on 12/1/19.
//  Copyright © 2019 Jasur Rajabov. All rights reserved.
//

import UIKit

class OnboardView: UIView {

    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDesc: UITextView!
    @IBOutlet weak var button: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
//        self.initViews()
    }
    
    private func initViews() {
//        bottomView.layer.cornerRadius = 10
//        bottomView.layer.maskedCorners = [.layerMinXMinYCorner]      
//        button.layer.cornerRadius = 3
    }
    
    

}
