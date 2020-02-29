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

class Reactions {
    
    private static var _shared:Reactions!
    
    static var shared:Reactions {
        if _shared == nil {
            _shared = Reactions()
        }
        return _shared
    }
    
    private var reactions:[Reaction] = [
        Reaction(time:"Reaction Time",day:"Performed at"),
        Reaction(time:"09:12",day:"12/02/2020 Fri 4:05 AM"),
        Reaction(time:"05:04",day:"14/02/2020 Sat 2:20 PM"),
        Reaction(time:"12:01",day:"Mon 5:00 PM"),
        Reaction(time:"23:20",day:"Tue 12:43 AM"),
        Reaction(time:"02:02",day:"Wed 3:34 AM"),
    ]
    
    private init(){
        
    }
    
    func getReaction(at index:Int)->Reaction? {
        if index >= 0 && index < reactions.count {
            return reactions[index]
        } else {
            return nil
        }
    }
    
    func numReactions()->Int{
        return reactions.count
    }
    
    subscript(index:Int) -> Reaction? {
        return index >= 0 && index < reactions.count ? reactions[index] : nil
    }
}

