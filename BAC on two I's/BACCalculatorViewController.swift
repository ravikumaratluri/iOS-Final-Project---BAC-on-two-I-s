//
//  BACCalculatorViewController.swift
//  BAC on two I's
//
//  Created by Student on 2/22/20.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit

class BACCalculatorViewController: UIViewController {
    
    /// All text fields to collect data for BAC
    @IBOutlet weak var weightTF: UITextField!
    @IBOutlet weak var beerTF: UITextField!
    @IBOutlet weak var wineTF: UITextField!
    @IBOutlet weak var liquorTF: UITextField!
    @IBOutlet weak var hoursTF: UITextField!
    @IBOutlet weak var minutesTF: UITextField!
    @IBOutlet weak var resultTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    /// calculate to calculate the BAC
    /// - Parameter sender: UIButton
    @IBAction func calculate(sender: Any){
        resultTF.text = "10.4 ~ sobriety"
    }
    
    /// clear to reset all fields
    /// - Parameter sender: UIButton
    @IBAction func clear(sender: Any){
        weightTF.text = ""
        beerTF.text = ""
        wineTF.text = ""
        liquorTF.text = ""
        hoursTF.text = ""
        minutesTF.text = ""
        resultTF.text = ""
    }
    
}
