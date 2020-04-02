//
//  ReationsLogViewController.swift
//  BAC on two I's
//
//  Created by Student on 2/22/20.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit
import Parse

class ReactionsLogViewController: UITableViewController {
    
    var reactionTimes:[Double] = []
    var reactionDays:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Reactions Log"
        
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
                    
                    
                    let startTime = formatter.date(from: startTimeRaw)
                    let endTime = formatter.date(from: endTimeRaw)
                    
        
                    let seconds = Double(Calendar.current.dateComponents([.second], from: startTime!, to: endTime!).second!)
                    
                    let dayNumber = Calendar.current.component(.weekday, from: startTime!)
                    var day:String = ""
                    if dayNumber == 1 {
                        day = "Sundnay"
                    } else if dayNumber == 2 {
                        day = "Monday"
                    } else if dayNumber == 3 {
                        day = "Tuesday"
                    }else if dayNumber == 4 {
                        day = "Wednesday"
                    }else if dayNumber == 5 {
                        day = "Thursday"
                    }else if dayNumber == 6 {
                        day = "Friday"
                    }else if dayNumber == 7 {
                        day = "Saturday"
                    }
                
                self.reactionTimes.append(seconds)
                self.reactionDays.append(day)
            }
        }
            //print(self.reactionDays.count)
        
    }
}

// Returns the number of sections
override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
}

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print(self.reactionTimes.count)
    return self.reactionTimes.count
}

// static values for the identifying the labels in table view
let timeLBLTag = 100
let dayLBLTag = 200

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let bac = tableView.dequeueReusableCell(withIdentifier: "bac", for: indexPath)
        let timeLBL = bac.viewWithTag(timeLBLTag) as! UILabel
        let dayLBL = bac.viewWithTag(dayLBLTag) as! UILabel
        timeLBL.text = String(reactionTimes[indexPath.row])
        dayLBL.text = String(reactionDays[indexPath.row])
    print(timeLBL.text,dayLBL.text)
    return bac
}
}
//import UIKit
//
//class ReactionsLogViewController: UITableViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        navigationItem.title = "Reactions Log"
//    }
//
//    // Returns the number of sections
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return Reactions.shared.numReactions()
//    }
//
//    // static values for the identifying the labels in table view
//    let timeLBLTag = 100
//    let dayLBLTag = 200
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let bac = tableView.dequeueReusableCell(withIdentifier: "bac", for: indexPath)
//        if let reaction = Reactions.shared[indexPath.row]{
//
//            let timeLBL = bac.viewWithTag(timeLBLTag) as! UILabel
//            let dayLBL = bac.viewWithTag(dayLBLTag) as! UILabel
//
//            timeLBL.text = reaction.time
//            dayLBL.text = reaction.day
//        }
//        return bac
//    }
//}
//
