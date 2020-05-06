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
    
    
    var reactions = Reactions.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Reactions Log (milliSec by Day)"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear Log", style: .plain, target: self, action: #selector(displayInfo(sender:)))
        NotificationCenter.default.addObserver(self, selector: #selector(reactionAdded(notification:)), name: NSNotification.Name(rawValue:"Added Reaction"), object: nil)
    }
    
    @objc func reactionAdded(notification:Notification){
        tableView.reloadData()
    }
    
    @objc
    func displayInfo(sender:Any){
        reactions.clearReaction()
        tableView.reloadData()
        let ac = UIAlertController(title: "Cleared", message: "Log has been cleared", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        ac.addAction(action)
        present(ac, animated: true, completion: nil)
    }
    
    // Returns the number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reactions.numReactions()
    }
    
    // static values for the identifying the labels in table view
    let timeLBLTag = 100
    let dayLBLTag = 200
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bac", for: indexPath)
        if reactions[indexPath.row] != nil {
            let timeLBL = cell.viewWithTag(timeLBLTag) as! UILabel
            let dayLBL = cell.viewWithTag(dayLBLTag) as! UILabel
            timeLBL.text = String(reactions.getReactionTime(indes: indexPath.row))
            dayLBL.text = reactions.getDay(index: indexPath.row)
        }
        return cell
        
    }
}
