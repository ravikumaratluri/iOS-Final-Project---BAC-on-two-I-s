//
//  Reactions.swift
//  BAC on two I's
//
//  Created by student on 2/24/20.
//  Copyright © 2020 student. All rights reserved.
//

import Foundation

struct Reaction {
    var time:String
    var day:String
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
    
    private var startTime:Date
    private var tappedTime:Date
    var reactionTime:TimeInterval
    
    private var reactions:[Reaction]
        /*
    = [
        Reaction(time:"Reaction Time",day:"Performed at"),
        Reaction(time:"09:12",day:"12/02/2020 Fri 4:05 AM"),
        Reaction(time:"05:04",day:"14/02/2020 Sat 2:20 PM"),
        Reaction(time:"12:01",day:"Mon 5:00 PM"),
        Reaction(time:"23:20",day:"Tue 12:43 AM"),
        Reaction(time:"02:02",day:"Wed 3:34 AM"),
    ]
    */
    private init(){
        self.startTime = Date()
        self.tappedTime = Date()
        reactionTime = 0.0
        reactions = []
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
