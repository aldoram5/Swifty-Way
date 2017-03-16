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
        
        let setting = UIUserNotificationSettings(types: [.sound, .alert], categories: nil)
        UIApplication.shared.registerUserNotificationSettings(setting)
        
    }
    
    func addSimpleButtonToCenter(){
        
        let centeredButton: UIButton = UIButton()
        centeredButton.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 75,y: UIScreen.main.bounds.height / 2 - 25,width: 150,height: 50)
        centeredButton.backgroundColor = UIColor.blue
        centeredButton.layer.masksToBounds = true
        centeredButton.setTitle("Press Me!!", for: UIControlState())
        centeredButton.setTitleColor(UIColor.white, for: UIControlState())
        centeredButton.layer.cornerRadius = 10.0
        centeredButton.addTarget(self, action: #selector(UILocalNotificationExampleViewController.scheduleNotifications), for: .touchUpInside)
        
        self.view.addSubview(centeredButton)
    }
    
    func scheduleNotifications(){
        let scheduledNotification: UILocalNotification = UILocalNotification()
        
        scheduledNotification.alertBody = "Hi! I am the notification body "
        //scheduledNotification.soundName = "yourShortSound.wav"
        scheduledNotification.timeZone = TimeZone.current
        scheduledNotification.fireDate = Date(timeIntervalSinceNow: 6)
        
        UIApplication.shared.scheduleLocalNotification(scheduledNotification)
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
