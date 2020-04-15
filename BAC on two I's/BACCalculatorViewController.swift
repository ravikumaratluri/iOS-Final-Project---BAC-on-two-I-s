//
//  BACCalculatorViewController.swift
//  BAC on two I's
//
//  Created by Student on 2/22/20.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit

class BACCalculatorViewController: UIViewController {
    
    //Variables to change the Text Fields to Doubles 
    private var weight:Double = 0.0
    private var beer:Double = 0.0
    private var wine:Double = 0.0
    private var liquor:Double = 0.0
    private var hours:Double = 0.0
    private var minutes:Double = 0.0
    private var numResult:String = ""
    
    //Variables for calculations
    private var eliminationRate = 0.00017
    private var timeConsuming:Double = 0.0
    private var gender:Double = 0.0
    private var bac:Double = 0.0
    
    /// All text fields to collect data for BAC
    @IBOutlet weak var weightTF: UITextField!
    @IBOutlet weak var beerTF: UITextField!
    @IBOutlet weak var wineTF: UITextField!
    @IBOutlet weak var liquorTF: UITextField!
    @IBOutlet weak var hoursTF: UITextField!
    @IBOutlet weak var minutesTF: UITextField!
    @IBOutlet weak var resultTF: UITextField!
    
   //Button for Male Icon
    @IBAction func maleButton(sender: UIButton){
        gender = 3.75
    }
    //Button for Female Icon
    @IBAction func femaleButton(sender: UIButton){
        gender = 4.7
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    /// calculate to calculate the BAC
    /// - Parameter sender: UIButton
    @IBAction func calculate(sender: Any){

        
        //Calculates BAC for Male Gender.
        if gender == 4.7{
            
                bac = ((beer + wine + liquor) * gender * eliminationRate * timeConsuming)/weight
            numResult = String(bac)
            resultTF.text = numResult
        }
        //Calculates BAC for Female Gender
        else if gender == 3.75{
            
                 bac = ((beer + wine + liquor) * gender * eliminationRate * timeConsuming)/weight
            numResult = String(bac)
            resultTF.text = numResult
            }
        
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
        gender = 0.0
    }
    
}
