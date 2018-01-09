//
//  ViewController.swift
//  OtherComponents
//
//  Created by Gaurav on 09/01/18.
//  Copyright © 2018 Gaurav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchbtn: UISwitch!
    
    @IBOutlet weak var sliderObj: UISlider!
    
    @IBOutlet weak var progressObj: UIProgressView!
    var timer:Timer!
    var progressVL:Float!
    
    @IBOutlet weak var stepperobj: UIStepper!
    
    @IBOutlet weak var lblStepper: UILabel!
    @IBOutlet weak var lblSlider: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sliderObj.minimumValue = 0
        sliderObj.maximumValue = 1000
        
        progressVL = 0
        progressObj.setProgress(0, animated: true)
        
    }
    
    
    @IBAction func slidervaluechange(_ sender: UISlider) {
        
        lblSlider.text = "vl = \(sender.value)"
    }
    
    @IBAction func togglechange(_ sender: UISwitch) {
        
        if sender.isOn
        {
            print("on")
         //   sender.setOn(false, animated: true)
        } else {
            print("off")
          //  sender.setOn(true, animated: true)
        }
    }
    @IBAction func btnstart(_ sender: UIButton) {
        
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updatevl), userInfo: nil, repeats: true)
    }
    
    @objc func updatevl()  {
        progressVL = progressVL + 0.1
         progressObj.setProgress(progressVL, animated: true)
        print(progressVL)
        
        if Int(progressVL) == 1 {
            timer.invalidate()
            
            progressObj.isHidden = true
            progressObj.removeFromSuperview()
           
        }
    }
    
    @IBAction func steppervlchanged(_ sender: UIStepper) {
        lblStepper.text = "\(stepperobj.value)"
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

