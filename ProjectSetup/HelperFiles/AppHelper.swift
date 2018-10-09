//
//  AppHelper.swift
//  ProjectSetup
//
//  Created by MOHIT SINGH on 08/10/18.
//  Copyright © 2018 MOHIT SINGH. All rights reserved.
//

import Foundation


class AppHelper{
    
    
    
    
    func setString(key:String,value:String){
        
        
        UserDefaults.standard.set(value, forKey: key)
        
        
    }
    
    func getString(key:String) -> String{
        
        return UserDefaults.standard.string(forKey: key)!
        
        
    }
    
    
    func removeObject(key:String){
        
        UserDefaults.standard.removeObject(forKey: key)
        
    }
    
    
    func removeObjects() {
        
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
        
    }
    
    
    
    
    
    
}
