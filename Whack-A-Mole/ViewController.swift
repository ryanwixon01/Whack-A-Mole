//
//  ViewController.swift
//  Whack-A-Mole
//
//  Created by Wixon, Ryan P on 10/15/20.
//  Copyright © 2020 Wixon, Ryan P. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var screenWidth = 0
    var screenHeight = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let screenBounds: CGRect = UIScreen.main.bounds
        screenWidth = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
        
        let scoreBox = UILabel(frame: CGRect(x:20, y:40, width: screenWidth / 5, height: screenHeight / 10))
        scoreBox.textAlignment = NSTextAlignment.center
        scoreBox.backgroundColor = UIColor.blue
        scoreBox.textColor = UIColor.white
        scoreBox.text = "0"
        
        let groundColor = UILabel(frame: CGRect(x:20, y:40, width: screenWidth - 40, height: screenHeight - 60))
        groundColor.backgroundColor = UIColor.green
        
        view.addSubview(groundColor)
        view.addSubview(scoreBox)
    }

    
}

