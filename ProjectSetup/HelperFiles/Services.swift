//
//  Services.swift
//  MyBarView
//
//  Created by MOHIT SINGH on 28/07/18.
//  Copyright © 2018 MOHIT SINGH. All rights reserved.
//

import Foundation
import Alamofire

class Services: NSObject {
    class func requestGETURL(_ strURL: String, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        if Reachability01.isConnectedToNetwork(){
          
        Alamofire.request(strURL).responseJSON { (responseObject) -> Void in
            
            print("Request: \(String(describing: responseObject.request))")   // original url request
            print("Response: \(String(describing: responseObject.response))") // http url response
            print("Result: \(responseObject.result)")
            
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
            
        }else{
            print("Internet Connection not Available!")
        }
    }
    
    class func requestPOSTURL(_ strURL : String, params : [String : AnyObject]?, headers : [String : String]?, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
        
      //   Alamofire.request(strURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (responseObject) -> Void in
            
        Alamofire.request(strURL, method: .post, parameters: params, headers: headers).responseJSON { (responseObject) -> Void in
            
            print("Request: \(String(describing: responseObject.request))")   // original url request
            print("Parameters: \(String(describing: params))")
            //print("Response: \(String(describing: responseObject.response))") // http url response
            print("Result: \(responseObject.result)")
            
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                print(resJson)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
}




/* ---- Use of get api
 
 
 func callLoginApi(){
 ACProgressHUD.shared.showHUD()
 
 let strURL = "\(serviceURL().baseURL)user_login.php?email=\(self.userNameField.text!)&password=\(self.passwordField.text!)&device_token=9990"
 Services.requestGETURL(strURL, success: {
 (JSONResponse) -> Void in
 
 ACProgressHUD.shared.hideHUD()
 print(JSONResponse)
 let dict = JSONResponse.dictionaryValue
 
 let status = dict["status"]?.stringValue
 let message = dict["message"]?.stringValue
 
 if status == "true"{
 let login = Login(parse: JSONResponse["data"])
 
 UserDefaults.standard.set(login.token_no, forKey: "token")
 UserDefaults.standard.set(login.name, forKey: "name")
 UserDefaults.standard.set(login.DOB, forKey: "DOB")
 UserDefaults.standard.set(login.email, forKey: "email")
 UserDefaults.standard.set(login.user_id, forKey: "user_id")
 UserDefaults.standard.set(login.mobile, forKey: "mobile")
 UserDefaults.standard.set(login.profile_pic, forKey: "profile_pic")
 UserDefaults.standard.set(login.notifiction_count, forKey: "notifiction_count")
 
 UserDefaults.standard.set(login.image_url, forKey: "image_url")
 
 self.view.makeToast(message)
 self.checkLevelApi()
 
 }
 else{
 self.view.makeToast(message)
 }
 
 
 
 }) {
 (error) -> Void in
 ACProgressHUD.shared.hideHUD()
 print(error)
 }
 }
 
 */



/*
 ---- Use of Post api
 
 
 func updateApiCall(){
 ACProgressHUD.shared.showHUD()
 var param = Parameters()
 
 param["token_no"] = UserDefaults.standard.string(forKey: "token")!
 param["email"] = emailField.text!
 param["name"] = userNameField.text!
 param["dob"] = dobTextField.text!
 param["mobile"] = mobileField.text!
 param["user_image"] = imageData!
 Services.requestPOSTURL("\(serviceURL().baseURL)update_profile.php", params: param as [String : AnyObject], headers: [:], success: {
 (JSONResponse) -> Void in
 
 ACProgressHUD.shared.hideHUD()
 print(JSONResponse)
 let dict = JSONResponse.dictionaryValue
 
 let status = dict["status"]?.stringValue
 let message = dict["message"]?.stringValue
 
 if status == "true"{
 
 let update = UpdateProfile(parse: JSONResponse["data"])
 
 UserDefaults.standard.set(update.token_no, forKey: "token")
 UserDefaults.standard.set(update.name, forKey: "name")
 UserDefaults.standard.set(update.DOB, forKey: "DOB")
 UserDefaults.standard.set(update.email, forKey: "email")
 UserDefaults.standard.set(update.user_id, forKey: "user_id")
 UserDefaults.standard.set(update.mobile, forKey: "mobile")
 UserDefaults.standard.set(update.profile_pic, forKey: "profile_pic")
 
 let imageDataDict:[String: String] = ["image": update.profile_pic]
 
 NotificationCenter.default.post(name: NSNotification.Name(rawValue: "imageFetch"), object: nil, userInfo: imageDataDict)
 
 self.view.makeToast(message)
 
 }
 else{
 self.view.makeToast(message)
 }
 
 
 
 }, failure: {
 (error) -> Void in
 ACProgressHUD.shared.hideHUD()
 print(error)
 })
 
 
 }
 
 
 */
