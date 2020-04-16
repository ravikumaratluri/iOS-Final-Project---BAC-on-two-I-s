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
    
    var reactions = Reactions.shared
    
    @IBOutlet weak var reactionSlider:UISlider!
    @IBOutlet weak var reactionCountLBL:UILabel!
    
    
    @IBAction func doSomething(sender: UISlider){
        print(sender.value)
        setData(sender: sender)
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
        navigationItem.title = "Reaction Graph"
        view.addSubview(lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.width(to: view)
        lineChartView.heightToWidth(of: view)
        setData(sender: reactionSlider)
    }
    
    /// setData funcion to set data on graph
    func setData(sender:UISlider){
        let percentageValue  = Int(floor(sender.value * Float(reactions.numReactions())))
        self.graphValues = []
        reactionCountLBL.text = "First \(percentageValue) Values"
            for index in 0..<percentageValue{
                if self.reactions.getReaction(at: index) != nil {
                    let ySeconds = reactions.getReactionTime(indes: index)
                    self.graphValues.append(ChartDataEntry(x: Double(index), y: ySeconds))
                }
            }
            
            let dataSet = LineChartDataSet(entries: self.graphValues, label: "Reaction Time in seconds")
            dataSet.lineWidth = 2
            let data = LineChartData(dataSet: dataSet)
            self.lineChartView.data = data
        }
    
}

