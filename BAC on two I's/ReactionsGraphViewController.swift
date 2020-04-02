//
//  ReactionsGraphViewController.swift
//  iOSCharts
//
//  Created by Student on 2/28/20.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit

import Charts
import TinyConstraints
import Parse

/// View Controller class for graph
class ReactionsGraphViewController: UIViewController {
    
    
    
    @IBAction func saveData(sender:Any){
        
        
    }
    
    
    /// static data as of now to display graph, y values as reaction time in seconds, x axis as number of reactions.
    var graphValues:[ChartDataEntry] = []
    
    
    /// lineChartView for displaying the chart
    lazy var lineChartView: LineChartView = {
        let lineChartView = LineChartView()
        lineChartView.backgroundColor = .systemGray
        lineChartView.rightAxis.enabled = false
        
        /// yAxis constraints
        let yAxis = lineChartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 15)
        yAxis.axisLineWidth = 2
        yAxis.axisLineColor = .black
        
        
        /// xAxis constraints
        let xAxis = lineChartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.axisLineWidth = 2
        xAxis.labelFont = .boldSystemFont(ofSize: 15)
        xAxis.axisLineColor = .black
        xAxis.labelHeight = 20
        
        
        lineChartView.animate(xAxisDuration: 2)
        return lineChartView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.width(to: view)
        lineChartView.heightToWidth(of: view)
        setData()
    }
    
    /// setData funcion to set data on graph
    func setData(){
        
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
                
                var count:Double = 0
                for object in objects {
                    print()
                    let formatter = DateFormatter()
                    formatter.dateFormat = "MM/dd/yyyy HH:mm:ss +SSSS"
                    formatter.timeZone = .autoupdatingCurrent
                    
                    
                    
                    let startTimeRaw = String(describing: object.object(forKey: "startTime")!)
                    let endTimeRaw = String(describing: object.object(forKey: "endTime")!)
                    
                    
                    let startTime = formatter.date(from: startTimeRaw)
                    let endTime = formatter.date(from: endTimeRaw)
                    
                    print(startTimeRaw)
                    print(startTime!)
                    print(endTimeRaw)
                    print(endTime!)
                    let ySeconds = Double(Calendar.current.dateComponents([.second], from: startTime!, to: endTime!).second!)
                    self.graphValues.append(ChartDataEntry(x: count, y: ySeconds))
                    count = count + 1
                }
            }
            
            let dataSet = LineChartDataSet(entries: self.graphValues, label: "Reaction Time in seconds")
            dataSet.lineWidth = 2
            let data = LineChartData(dataSet: dataSet)
            self.lineChartView.data = data
        }
        
    }
    
    
}

