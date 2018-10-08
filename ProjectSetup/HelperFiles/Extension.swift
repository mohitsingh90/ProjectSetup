//
//  Extension.swift
//  MyBarView
//
//  Created by MOHIT SINGH on 27/07/18.
//  Copyright © 2018 MOHIT SINGH. All rights reserved.
//

import Foundation
import UIKit

extension Array where Element: Hashable {
    var histogram: [Element: Int] {
        return self.reduce(into: [:]) { counts, elem in counts[elem, default: 0] += 1 }
    }
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
/*
 
 let rightView = UIView
 rightButton.setImage(buttonImage, for: .normal)
 rightButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0)
 rightButton.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
 // button.addTarget(self, action: #selector(self.refresh), for: .touchUpInside)
 self.rightView = rightButton
 self.rightViewMode = .always
 */
extension UITextField{
    //Set TextField Right Button
   
    func setRightView(image:UIImage){
        let rightView = UIImageView()
        rightView.image = image
        rightView.frame = CGRect(x: CGFloat(25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        self.rightView = rightView
        self.rightViewMode = .always
        
    }
    func setLeftView(image:UIImage){
        let leftView = UIImageView()
        leftView.image = image
        leftView.frame = CGRect(x: CGFloat(25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        self.leftView = leftView
        self.rightViewMode = .always
        
    }
   
}


extension UIColor {
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = String(hexString[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}
