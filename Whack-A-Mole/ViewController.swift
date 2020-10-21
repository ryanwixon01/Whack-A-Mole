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
    
    var groundColor = UILabel()
    
    var mole1 = UIButton()
    var molesHit = 0
    
    var timer = Timer()
    
    var winLabel = UILabel()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let screenBounds: CGRect = UIScreen.main.bounds
        screenWidth = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
        
        //frame for keeping the score
        scoreBox = UILabel(frame: CGRect(x:20, y:40, width: screenWidth / 5, height: screenHeight / 10))
        scoreBox.backgroundColor = UIColor.blue
        scoreBox.textAlignment = NSTextAlignment.center
        scoreBox.textColor = UIColor.white
        scoreBox.text = "\(score)"
        
        //color for the ground
        if(screenWidth < screenHeight)
        {
            groundColor = UILabel(frame: CGRect(x:20, y:40, width: screenWidth - 40, height: screenHeight - 60))
        }
        else
        {
            groundColor = UILabel(frame: CGRect(x:20, y:20, width: screenWidth - 60, height: screenHeight - 40))
        }
        groundColor.backgroundColor = UIColor.green
        
        //moles
        mole1.frame = CGRect(x: Int.random(in: 20...screenWidth - 70), y: Int.random(in: 20...screenHeight - 70), width: 50, height: 50)
        mole1.layer.cornerRadius = mole1.frame.width / 2
        mole1.backgroundColor = UIColor.brown
        mole1.addTarget(self, action: #selector(moleHit), for: .touchUpInside)
        
        //timer
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(moleMissed), userInfo: nil, repeats: true)
        
        //winning message
        winLabel = UILabel(frame: CGRect(x: (screenWidth / 2) - 100, y: (screenHeight / 2) - 50, width: 200, height: 100))
        winLabel.backgroundColor = UIColor.blue
        winLabel.textAlignment = NSTextAlignment.center
        winLabel.textColor = UIColor.white
        winLabel.text = "You win!"
        
        
        //drawing
        view.addSubview(groundColor)
        view.addSubview(mole1)
        view.addSubview(scoreBox)
        
    }
    
    @objc func moleHit(_sender: UIButton)
    {
        print("Ouch!")
        timer.invalidate()
        
        //increment score
        score += 1
        scoreBox.text = "\(score)"
        molesHit += 1
        
        //remove mole
        mole1.removeFromSuperview()
        
        //add mole back
        if(molesHit < 10)
        {
            mole1.frame = CGRect(x: Int.random(in: 20...screenWidth - 70), y: Int.random(in: 40...screenHeight - 70), width: 50, height: 50)
            view.addSubview(mole1)
            
            //restart the timer
            timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(moleMissed), userInfo: nil, repeats: true)
        }
        else
        {
            view.addSubview(winLabel)
        }
    }
    
    @objc func moleMissed(_sender: UIButton)
    {
        //remove mole
        mole1.removeFromSuperview()
        
        //add mole back
        mole1.frame = CGRect(x: Int.random(in: 20...screenWidth - 70), y: Int.random(in: 40...screenHeight - 70), width: 50, height: 50)
        view.addSubview(mole1)
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        
        NSLog("bounds = \(self.view.bounds)")
        
        let screenBounds: CGRect = UIScreen.main.bounds
        screenWidth = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
        
        if(screenWidth < screenHeight)
        {
            groundColor.frame = CGRect(x:20, y:40, width: screenWidth - 40, height: screenHeight - 60)
            scoreBox.frame = CGRect(x:20, y:40, width: screenWidth / 5, height: screenHeight / 10)
            winLabel.frame = CGRect(x: (screenWidth / 2) - 100, y: (screenHeight / 2) - 50, width: 200, height: 100)
        }
        else
        {
            groundColor.frame = CGRect(x:20, y:20, width: screenWidth - 60, height: screenHeight - 40)
            scoreBox.frame = CGRect(x:20, y:20, width: screenWidth / 10, height: screenHeight / 5)
            winLabel.frame = CGRect(x: (screenWidth / 2) - 100, y: (screenHeight / 2) - 50, width: 200, height: 100)
        }
        
        if(mole1.frame.minX < 20 || mole1.frame.maxX > groundColor.frame.maxX || mole1.frame.minY < groundColor.frame.minY || mole1.frame.maxY > groundColor.frame.maxY)
        {
            mole1.frame = CGRect(x:200, y:200, width:50, height:50)
        }
    }
}
