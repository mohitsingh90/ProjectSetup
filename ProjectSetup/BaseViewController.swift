//
//  BaseViewController.swift
//  MyBarView
//
//  Created by MOHIT SINGH on 28/07/18.
//  Copyright © 2018 MOHIT SINGH. All rights reserved.
//

import UIKit
class BaseViewController: UIViewController {

    var NavigationTitle: String?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var backButton:UIButton!
    var backButtonImage:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
       self.setupNavigationBar()
        
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


    var label:UILabel!
    func setupNavigationBar(){
        //Setup navigationbar
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.sizeToFit()
        
        let leftItem = UIBarButtonItem(customView: label)
        //self.navigationItem.leftBarButtonItem = leftItem

       /* label.textColor = UIColor.white
        label.textAlignment = .left
        self.navigationItem.titleView = label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: label.superview, attribute: .centerX, multiplier: 1, constant: 0))
        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .width, relatedBy: .equal, toItem: label.superview, attribute: .width, multiplier: 1, constant: 0))
        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: label.superview, attribute: .centerY, multiplier: 1, constant: 0))
        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: label.superview, attribute: .height, multiplier: 1, constant: 0))
        
        */
        
    //    self.navigationController?.navigationBar.barTintColor = customeColor().blue
     //   self.navigationController?.navigationBar.backgroundColor = customeColor().blue
        self.navigationItem.setHidesBackButton(true, animated:true);
        //        self.navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height:30))
        backButtonImage = UIImageView(frame: CGRect(x:0, y: 5, width: 20, height: 20))
        //backButtonImage.image = UIImage(named: "goback_white")
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        backButton.addSubview(backButtonImage)
        
         let backBarButton = UIBarButtonItem(customView: backButton)
        
           self.navigationItem.leftBarButtonItems = [backBarButton,leftItem]
        
        
    }

    @objc func backButtonClicked(){
        
            self.navigationController?.popViewController(animated: true)
      
    }
   
}
