//
//  UIAlertControllerExampleViewController.swift
//  SwiftyWay
//
//  Created by Aldo Rangel on 11/17/15.
//  Copyright © 2015 crimsonrgames. All rights reserved.
//

import UIKit

class UIAlertControllerExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addSimpleButtonToCenter()
        // Do any additional setup after loading the view.
    }
    
    func addSimpleButtonToCenter(){

        let centeredButton: UIButton = UIButton()
        centeredButton.frame = CGRectMake(UIScreen.mainScreen().bounds.width / 2 - 75,UIScreen.mainScreen().bounds.height / 2 - 25,150,50)
        centeredButton.backgroundColor = UIColor.orangeColor()
        centeredButton.layer.masksToBounds = true
        centeredButton.setTitle("Press Me!", forState: UIControlState.Normal)
        centeredButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        centeredButton.layer.cornerRadius = 10.0
        centeredButton.addTarget(self, action: "showAlert:", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(centeredButton)
    }
    func showAlert(sender: UIButton){
        
        let alert: UIAlertController = UIAlertController(title: "Message", message: "Why do you obey a button, Alice?", preferredStyle: .Alert)
        
        let someAction = UIAlertAction(title: "OK", style: .Default) { action in
            print("Some Action Occurred")
        }
        
        alert.addAction(someAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
