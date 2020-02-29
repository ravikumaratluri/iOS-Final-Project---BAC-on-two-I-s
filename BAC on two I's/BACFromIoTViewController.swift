//
//  BACFromIoTViewController.swift
//  BAC on two I's
//
//  Created by Student on 2/22/20.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit

class BACFromIoTViewController: UIViewController {
    
    @IBOutlet weak var rateLBL:UILabel!
    @IBOutlet weak var stageLBL:UILabel!
    @IBOutlet weak var recordedAtLBL:UILabel!
    
    @IBAction func getBAC(sender: Any){
        let rate = 10.45
        let stage = "sobriety"
        let recordedAt = "Fri 10:16 PM"
        rateLBL.text = String(rate)
        stageLBL.text = stage
        recordedAtLBL.text = recordedAt
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "BAC from IoT"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
