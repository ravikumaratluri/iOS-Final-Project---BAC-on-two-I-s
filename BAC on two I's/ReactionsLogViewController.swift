//
//  ReationsLogViewController.swift
//  BAC on two I's
//
//  Created by Student on 2/22/20.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit

class ReactionsLogViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Reactions Log"
    }
 
    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return Reactions.shared.numReactions()
        }
        
        let timeLBLTag = 100
        let dayLBLTag = 200
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let bac = tableView.dequeueReusableCell(withIdentifier: "bac", for: indexPath)
            if let reaction = Reactions.shared[indexPath.row]{
            
                let timeLBL = bac.viewWithTag(timeLBLTag) as! UILabel
                let dayLBL = bac.viewWithTag(dayLBLTag) as! UILabel
                
                timeLBL.text = reaction.time
                dayLBL.text = reaction.day
            }
            return bac
        }
}

