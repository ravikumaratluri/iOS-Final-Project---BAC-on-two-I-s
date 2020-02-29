//
//  FirstViewController.swift
//  BAC on two I's
//
//  Created by Student on 2/22/20.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit

class ReactionViewController: UIViewController {
    
    /// blinking button to display at random positions
    @IBOutlet weak var blinkingButton:UIButton!
    
    
    /// view for the blinking button
    @IBOutlet weak var reactionAreaView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blinkingButton.isHidden = true
        navigationItem.title = "Try How Fast you React"
    }
    
    /// startBtn to start to display the blinking button to start calculate reaction
    /// - Parameter sender: UIButton
    @IBAction func startBtn(_ sender: Any) {
        blinkingButton.isHidden = false
    }
    
    /// stopBtn for stopping the blinking button action
    /// - Parameter sender: UIButton
    @IBAction func stopBtn(_ sender: Any) {
        blinkingButton.isHidden = true
    }
    
    /// reactionBtn to relocate the blinking button when clicked
    /// - Parameter sender: UIButton
    @IBAction func reactionBtn(_ sender: Any) {
        
        // Find the blinkingButton's width and height
        let blinkingButtonWidth = blinkingButton.frame.width
        let blinkingButtonHeight = blinkingButton.frame.height
        
        // Find the width and height of the enclosing view
        let currentViewWidth = blinkingButton.superview!.bounds.width
        let currentViewHeight = blinkingButton.superview!.bounds.height
        
        // Compute width and height of the area to contain the button's center
        let newWidth = currentViewWidth - blinkingButtonWidth
        let newHeight = currentViewHeight - blinkingButtonHeight
        
        // offset values
        let xoffset = CGFloat(arc4random_uniform(UInt32(newWidth)))
        let yoffset = CGFloat(arc4random_uniform(UInt32(newHeight)))
        
        // Offset the button's center by the random offsets.
        blinkingButton.center.x = xoffset + blinkingButtonWidth / 2
        blinkingButton.center.y = yoffset + blinkingButtonHeight / 2
    }
    
}

