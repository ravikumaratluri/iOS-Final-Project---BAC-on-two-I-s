//
//  Reactions.swift
//  BAC on two I's
//
//  Created by student on 2/24/20.
//  Copyright © 2020 student. All rights reserved.
//

import Foundation
import Parse

struct Reaction {
    var startTime:String
    var endTime:String
    var user:String
}

/// Model for reaction database table
class Reactions {
    
    private static var _shared:Reactions!
    
    static var shared:Reactions {
        if _shared == nil {
            _shared = Reactions()
        }
        return _shared
    }
    
    /// <#Description#>
    private var reactions:[Reaction] = []
    
    private var days = ["Sundnay", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

    private init(){
                let query = PFQuery(className:"newTesting")
                query.whereKey("user", equalTo:"new")
                query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
                    if let error = error {
                        // Log details of the failure
                        print(error.localizedDescription)
                    } else if let objects = objects {
                        // The find succeeded.
                        print("Successfully retrieved \(objects.count) scores.")
                        // Do something with the found objects
                        for object in objects {
                            print()
                            let formatter = DateFormatter()
                            formatter.dateFormat = "MM/dd/yyyy HH:mm:ss +SSSS"
                            formatter.timeZone = .autoupdatingCurrent
                            let startTimeRaw = String(describing: object.object(forKey: "startTime")!)
                            let endTimeRaw = String(describing: object.object(forKey: "endTime")!)
                            let user = "new"
                            let reaction = Reaction(startTime: startTimeRaw, endTime: endTimeRaw, user: user)
                            self.reactions.append(reaction)
                        }
                    }
                }
    }
                
    
    
    
    /// getReaction to get the particular reaction
    /// - Parameter index: index
    func getReaction(at index:Int)->Reaction? {
        if index >= 0 && index < reactions.count {
            return reactions[index]
        } else {
            return nil
        }
    }
    
    /// numReactions to show the count of reactions recorded
    func numReactions()->Int{
        return reactions.count
    }
    
    subscript(index:Int) -> Reaction? {
        return index >= 0 && index < reactions.count ? reactions[index] : nil
    }
    
    func addReaction(startTime:String, endTime:String) {
        let reaction = PFObject(className : "newTesting")
        reaction["startTime"] = startTime
        reaction["endTime"] = endTime
        reaction["user"] = "new"
        reaction.saveInBackground {
        (success: Bool, error: Error?) -> Void in
        
            if (success) {
                  print("success")
                }
            else{
                print("error")
               }
        }
        self.reactions.append(Reaction(startTime: startTime, endTime: endTime, user: "new"))
    }
    
    func getReactionTime(indes:Int) -> Double {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy HH:mm:ss +SSSS"
        formatter.timeZone = .autoupdatingCurrent
        let reaction  = reactions[indes]
        let startTime = formatter.date(from: reaction.startTime)
        let endTime = formatter.date(from: reaction.endTime)
        
        
        var startIndex = reaction.startTime.index(reaction.startTime.startIndex, offsetBy: 21)
        var endIndex = reaction.startTime.index(reaction.startTime.endIndex, offsetBy: -1)
        let range = startIndex..<endIndex
        let startMilliseconds = Double(reaction.startTime[range])!
        
        startIndex = reaction.endTime.index(reaction.endTime.startIndex, offsetBy: 21)
        endIndex = reaction.endTime.index(reaction.endTime.endIndex, offsetBy: -1)
        
        let endMilliseconds = Double(reaction.endTime[range])!
        
        var differenceInMilliseconds = endMilliseconds - startMilliseconds
        differenceInMilliseconds = differenceInMilliseconds < 0 ? (1000+differenceInMilliseconds) : differenceInMilliseconds
        
        
        let seconds = Double(Calendar.current.dateComponents([.second], from: startTime!, to: endTime!).second!)
        
        let totalMilliSeconds = (seconds * 1000) + differenceInMilliseconds
        return totalMilliSeconds
    }
    
    func getDay(index:Int) -> String {
        
        let formatter = DateFormatter()
        let todayDateTime = Date()
        formatter.dateFormat = "MM/dd/yyyy HH:mm:ss +SSSS"
        formatter.timeZone = .autoupdatingCurrent
        let reaction  = reactions[index]
        let startTime = formatter.date(from: reaction.startTime)
        let todayTime = formatter.date(from: formatter.string(from: todayDateTime))
        
        let days = Calendar.current.dateComponents([.day], from: startTime!, to: todayTime!).day!
        
        if days < 7{
            let dayNumber = Calendar.current.component(.weekday, from: startTime!)
            return self.days[dayNumber-1]
        }else{
            let formatterTwo = DateFormatter()
            formatterTwo.dateFormat = "MM/dd/yyyy"
            return String(formatterTwo.string(from: startTime!))
        }
    }
    /*
    func calculateStartTime() -> String {
        
                    startTime = Date()
         
                    let formatter = DateFormatter()
                    formatter.dateFormat = "MM/dd/yyyy EEEE HH:mm:ss.SSS a"
    
                    let startTimeAndDate = formatter.string(from: startTime as Date)
                   
                 print("start: \(startTimeAndDate)")
                    return startTimeAndDate
        }
    
    func calculateTappedTime()  -> String {
        
               tappedTime = Date()
            let formatter = DateFormatter()
                formatter.dateFormat = "MM/dd/yyyy EEEE HH:mm:ss.SSS a"
        
                let tappedTimeAndDate = formatter.string(from: tappedTime as Date)
                     print("tap: \(tappedTimeAndDate)")
            return tappedTimeAndDate
                
        }
    
    func calculateReactionTime() -> String {
        
        let reactionTime = String(format:"%.6f",tappedTime.timeIntervalSince(startTime as Date))
        startTime = tappedTime

         print("reaction: \(reactionTime)")
        return reactionTime
    }
   */
}
