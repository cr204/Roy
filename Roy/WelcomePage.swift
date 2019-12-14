//
//  WelcomePage.swift
//  Roy
//
//  Created by Jasur Rajabov on 12/1/19.
//  Copyright © 2019 Jasur Rajabov. All rights reserved.
//

import UIKit

class WelcomePage: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides:[OnboardView] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }
    

    func createSlides() -> [OnboardView] {
        
        
        let slide1:OnboardView = Bundle.main.loadNibNamed("onboard", owner: self, options: nil)?.first as! OnboardView
        slide1.imageView.image = UIImage(named: "onboard1")
        slide1.labelTitle.text = "Welcome"
        slide1.button.isHidden = true
        slide1.bottomView.layer.cornerRadius = 20
        slide1.bottomView.layer.maskedCorners = [.layerMinXMinYCorner]
        slide1.labelDesc.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis "
        
        let slide2:OnboardView = Bundle.main.loadNibNamed("onboard", owner: self, options: nil)?.first as! OnboardView
        slide2.imageView.image = UIImage(named: "onboard2")
        slide2.labelTitle.text = "ASK"
        slide2.button.isHidden = true
        slide2.labelDesc.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis "
        
        let slide3:OnboardView = Bundle.main.loadNibNamed("onboard", owner: self, options: nil)?.first as! OnboardView
        slide3.imageView.image = UIImage(named: "onboard3")
        slide3.labelTitle.text = "HELP"
        slide3.button.isHidden = false
        slide3.button.layer.cornerRadius = 3
        slide3.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        slide3.bottomView.layer.cornerRadius = 20
        slide3.bottomView.layer.maskedCorners = [.layerMaxXMinYCorner]
        slide3.labelDesc.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis "
     
        
        return [slide1, slide2, slide3]
    }
    
    func setupSlideScrollView(slides : [OnboardView]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        if #available(iOS 11, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        }
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    /*
        * default function called when view is scolled. In order to enable callback
        * when scrollview is scrolled, the below code needs to be called:
        * slideScrollView.delegate = self or
        */
       func scrollViewDidScroll(_ scrollView: UIScrollView) {
           let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
           pageControl.currentPage = Int(pageIndex)
    }
    
    func scrollView(_ scrollView: UIScrollView, didScrollToPercentageOffset percentageHorizontalOffset: CGFloat) {
        if(pageControl.currentPage == 0) {
            //Change background color to toRed: 103/255, fromGreen: 58/255, fromBlue: 183/255, fromAlpha: 1
            //Change pageControl selected color to toRed: 103/255, toGreen: 58/255, toBlue: 183/255, fromAlpha: 0.2
            //Change pageControl unselected color to toRed: 255/255, toGreen: 255/255, toBlue: 255/255, fromAlpha: 1
            
            let pageUnselectedColor: UIColor = fade(fromRed: 255/255, fromGreen: 255/255, fromBlue: 255/255, fromAlpha: 1, toRed: 103/255, toGreen: 58/255, toBlue: 183/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
            pageControl.pageIndicatorTintColor = pageUnselectedColor
        
            
            let bgColor: UIColor = fade(fromRed: 103/255, fromGreen: 58/255, fromBlue: 183/255, fromAlpha: 1, toRed: 255/255, toGreen: 255/255, toBlue: 255/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
            slides[pageControl.currentPage].backgroundColor = bgColor
            
            let pageSelectedColor: UIColor = fade(fromRed: 81/255, fromGreen: 36/255, fromBlue: 152/255, fromAlpha: 1, toRed: 103/255, toGreen: 58/255, toBlue: 183/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
            pageControl.currentPageIndicatorTintColor = pageSelectedColor
        }
    }
    
    func fade(fromRed: CGFloat,
              fromGreen: CGFloat,
              fromBlue: CGFloat,
              fromAlpha: CGFloat,
              toRed: CGFloat,
              toGreen: CGFloat,
              toBlue: CGFloat,
              toAlpha: CGFloat,
              withPercentage percentage: CGFloat) -> UIColor {
        
        let red: CGFloat = (toRed - fromRed) * percentage + fromRed
        let green: CGFloat = (toGreen - fromGreen) * percentage + fromGreen
        let blue: CGFloat = (toBlue - fromBlue) * percentage + fromBlue
        let alpha: CGFloat = (toAlpha - fromAlpha) * percentage + fromAlpha
        
        // return the fade colour
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    @objc func buttonTapped(sender: UIButton) {
        
        print("buttonTapped()")
        
//        let navigationController = window?.rootViewController as! UINavigationController
        let viewController = SignUpLoginController()
        navigationController?.pushViewController(viewController, animated: true)
        
    }
}
