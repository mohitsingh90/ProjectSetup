//
//  Utilities.swift
//  Axiss
//
//  Created by Pravin Kumar on 10/3/18.
//  Copyright © 2018 chhavi  kaushik. All rights reserved.
//

import Foundation
class Utilities{
    
    
    // This function help to convert array of string date to date array
    static func sortDate(dates:[String]) -> [String]{
        
        var convertedArray: [String] = []
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        for dat in dates {
            let date = dateFormatter.date(from: dat)
            
            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateFormatter.timeZone = TimeZone(identifier: "UTC")
            
            let fullDate = "\(date!)"
            let saprateDate = fullDate.split(separator: " ")
            let onlyDate =  "\(saprateDate[0])"
          
            if let date:String = onlyDate {
            
                convertedArray.append(date)
            }
        }
        
        
        print("converted array\(convertedArray)")
        
        let sortedDate = convertedArray.sorted(by: { $0.compare($1) == .orderedDescending })
        
        
        print("unsort\(dates)")
        print("sort\(sortedDate)")
        return sortedDate
        
        
        
    }
   
    
    
    //Use convertDateFormater func//let dateTime = self.convertDateFormaterAamer(sendTimeStep, inputDateFormate: "dd-MM-yyyy HH:mm:ss", outputDateFormate: "dd-MMM-yyyy hh:mm a")

    static func convertDateFormater(date: String,inputDateFormate: String , outputDateFormate: String) -> String
    {
        let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        //dateFormatter.timeZone = NSTimeZone(name: "UTC")
        dateFormatter.dateFormat = inputDateFormate
        
        
        let date = dateFormatter.date(from: date)
        
        //dateFormatter.dateFormat = "yyyy MMM EEEE HH:mm"
        //dateFormatter.timeZone = NSTimeZone(name: "UTC")
        dateFormatter.dateFormat = outputDateFormate
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        
        var timeStamp = ""
        if (date != nil)
        {
            timeStamp = dateFormatter.string(from: date!)
        }
        return timeStamp
    }
    
    
    func convertDateFormate(date : Date) -> String{
        // Day
        let calendar = Calendar.current
        let anchorComponents = calendar.dateComponents([.day, .month, .year], from: date)
        
        // Formate
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = "MMM, yyyy"
        let newDate = dateFormate.string(from: date)
        
        var day  = "\(anchorComponents.day!)"
        switch (day) {
        case "1" , "21" , "31":
            day.append("st")
        case "2" , "22":
            day.append("nd")
        case "3" ,"23":
            day.append("rd")
        default:
            day.append("th")
        }
        return day
    }
    
    
}
