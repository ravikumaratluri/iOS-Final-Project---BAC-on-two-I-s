//
//  BACCalculatorViewController.swift
//  BAC on two I's
//
//  Created by Student on 2/22/20.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit

class BACCalculatorViewController: UIViewController {
    
    private var weight:Double = 0.0
    private var beer:Double = 0.0
    private var wine:Double
    private var liquor:Double
    private var hours:Double
    private var minutes:Double
    private var numResult:String
    
    private var eliminationRate = 0.00017
    private var timeConsuming:Double
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
    
    
    @IBAction func maleButton(sender: UIButton){
        gender = 3.75
    }
    @IBAction func femaleButton(sender: UIButton){
        gender = 4.7
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
//    init(){
//        weight = Double(weightTF.text)
//        beer = Double(beerTF.text)
//        wine = Double(wineTF.text)
//        liquor = Double(liquorTF.text)
//        hours = Double(hoursTF.text)
//        minutes = Double(minutesTF.text)
//    }
    
    /// calculate to calculate the BAC
    /// - Parameter sender: UIButton
    @IBAction func calculate(sender: Any){
//        if let text = self.resultTF.text{
//            var numResult = Double(text)
        
        if gender == 4.7{
            
                bac = ((beer + wine + liquor) * gender * eliminationRate * timeConsuming)/weight
            numResult = String(bac)
            resultTF.text = numResult
        }
            
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
