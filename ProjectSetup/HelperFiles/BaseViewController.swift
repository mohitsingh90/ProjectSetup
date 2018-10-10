//
//  BaseViewController.swift
//  MyBarView
//
//  Created by MOHIT SINGH on 28/07/18.
//  Copyright © 2018 MOHIT SINGH. All rights reserved.
//

import UIKit
import Reachability
class BaseViewController: UIViewController {

    var NavigationTitle: String?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var backButton:UIButton!
    var backButtonImage:UIImageView!
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("Appear")
        //declare this property where it won't go out of scope relative to your listener
        let reachability = Reachability()!
        
        //declare this inside of viewWillAppear
        
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        do{
            try reachability.startNotifier()
        }catch{
            print("could not start reachability notifier")
        }
        
        
       /* and for stopping notifications
            
            reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)*/
        
        
        
    }
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
        
        self.navigationController?.navigationBar.barTintColor = UIColor.blue
        self.navigationController?.navigationBar.backgroundColor = UIColor.blue
        self.navigationItem.setHidesBackButton(true, animated:true);

        
        
        // Setup left contents
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.text = "Demo"
        label.sizeToFit()
        
        let leftItem = UIBarButtonItem(customView: label)
        self.navigationItem.leftBarButtonItem = leftItem
  
        backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height:30))
        backButtonImage = UIImageView(frame: CGRect(x:0, y: 5, width: 20, height: 20))
        backButtonImage.image = UIImage(named: "goback_white")
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        backButton.addSubview(backButtonImage)
        
         let backBarButton = UIBarButtonItem(customView: backButton)
        
           self.navigationItem.leftBarButtonItems = [backBarButton,leftItem]
        
        
    }

    @objc func backButtonClicked(){
        
            self.navigationController?.popViewController(animated: true)
      
    }
    
    @objc func reachabilityChanged(note: Notification) {
        print("called")
        let reachability = note.object as! Reachability
        
        switch reachability.connection {
        case .wifi:
            print("Reachable via WiFi")
             self.view.makeToast(internetConnected_wifi)
        case .cellular:
            print("Reachable via Cellular")
             self.view.makeToast(internetConnected_cell)
        case .none:
            print("Network not reachable")
            
            self.view.makeToast(internetConnectionError)
        }
    }
    
    
   
}
