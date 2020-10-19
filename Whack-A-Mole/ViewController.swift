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
    
    var scoreBox = UILabel()
    var score = 0
    
    var mole1 = UIButton()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let screenBounds: CGRect = UIScreen.main.bounds
        screenWidth = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
        
        //frame for keeping the score
        scoreBox = UILabel(frame: CGRect(x:20, y:40, width: screenWidth / 5, height: screenHeight / 10))
        scoreBox.textAlignment = NSTextAlignment.center
        scoreBox.backgroundColor = UIColor.blue
        scoreBox.textColor = UIColor.white
        scoreBox.text = "\(score)"
        
        //color for the ground
        let groundColor = UILabel(frame: CGRect(x:20, y:40, width: screenWidth - 40, height: screenHeight - 60))
        groundColor.backgroundColor = UIColor.green
        
        //moles
        mole1.frame = CGRect(x: 200, y: 100, width: 50, height: 50)
        mole1.layer.cornerRadius = mole1.frame.width / 2
        mole1.backgroundColor = UIColor.brown
        mole1.addTarget(self, action: #selector(moleHit), for: .touchUpInside)
        
        //drawing
        view.addSubview(groundColor)
        view.addSubview(mole1)
        view.addSubview(scoreBox)
        
    }
    
    @objc func moleHit(_sender: UIButton)
    {
        print("Ouch!")
        
        //increment score
        score += 1
        scoreBox.text = "\(score)"
        
        //remove mole
        mole1.removeFromSuperview()
    }
}
