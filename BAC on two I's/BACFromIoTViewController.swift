//
//  BACFromIoTViewController.swift
//  BAC on two I's
//
//  Created by Student on 2/22/20.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit

class BACFromIoTViewController: UIViewController {
    
    /// rateLBL for the rate of BAC
    @IBOutlet weak var rateLBL:UILabel!
    
    /// stageLBL for the drinking stage
    @IBOutlet weak var stageLBL:UILabel!
    
    /// recordedAtLBL for the date and time recorded
    @IBOutlet weak var recordedAtLBL:UILabel!
    
    /// getBAC for the getting BAC value from some API
    /// - Parameter sender: UIButton
    @IBAction func getBAC(sender: Any){
        
        //as of now displaying all static data
        let rate = 10.45
        let stage = "Sobriety"
        let recordedAt = "Fri 10:16 PM"
        rateLBL.text = String(rate)
        stageLBL.text = stage
        recordedAtLBL.text = recordedAt
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "BAC from IoT"
    }
    
}
