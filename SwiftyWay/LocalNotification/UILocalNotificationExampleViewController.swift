//
//  UILocalNotificationExampleViewController.swift
//  SwiftyWay
//
//  Created by Aldo Rangel on 11/17/15.
//  Copyright © 2015 crimsonrgames. All rights reserved.
//

import UIKit

class UILocalNotificationExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        registerForLocalNotifications()
        addSimpleButtonToCenter()
    }
    
    func registerForLocalNotifications(){
        
        let setting = UIUserNotificationSettings(forTypes: [.Sound, .Alert], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(setting)
        
    }
    
    func addSimpleButtonToCenter(){
        
        let centeredButton: UIButton = UIButton()
        centeredButton.frame = CGRectMake(UIScreen.mainScreen().bounds.width / 2 - 75,UIScreen.mainScreen().bounds.height / 2 - 25,150,50)
        centeredButton.backgroundColor = UIColor.blueColor()
        centeredButton.layer.masksToBounds = true
        centeredButton.setTitle("Press Me!!", forState: UIControlState.Normal)
        centeredButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        centeredButton.layer.cornerRadius = 10.0
        centeredButton.addTarget(self, action: "scheduleNotifications", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(centeredButton)
    }
    
    func scheduleNotifications(){
        let scheduledNotification: UILocalNotification = UILocalNotification()
        
        scheduledNotification.alertBody = "Hi! I am the notification body "
        //scheduledNotification.soundName = "yourShortSound.wav"
        scheduledNotification.timeZone = NSTimeZone.defaultTimeZone()
        scheduledNotification.fireDate = NSDate(timeIntervalSinceNow: 6)
        
        UIApplication.sharedApplication().scheduleLocalNotification(scheduledNotification)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
