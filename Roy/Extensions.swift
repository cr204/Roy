//
//  Extensions.swift
//  Roy
//
//  Created by Jasur Rajabov on 12/14/19.
//  Copyright © 2019 Jasur Rajabov. All rights reserved.
//

import UIKit


extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDictionary))
    }
    
    func maskByRoundingCorners(_ masks: UIRectCorner, withRadii radii: CGSize = CGSize(width: 10, height: 10)) {
        guard !masks.isEmpty else { self.layer.mask = nil; return }
        
        let rounded = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: masks, cornerRadii: radii)

        let shape = CAShapeLayer()
        shape.path = rounded.cgPath

        self.layer.mask = shape
    }
}

extension UITextField {
    func setPadding(_ amount:CGFloat) {
        self.setLeftPaddingPoints(amount)
        self.setRightPaddingPoints(amount)
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
