//
//  MasterViewController.swift
//  SwiftyWay
//
//  Created by Aldo Rangel on 11/2/15.
//  Copyright © 2015 crimsonrgames. All rights reserved.
//


/*

Generated code for Master - Detail app

*/

import UIKit

class MasterViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    var tutorials = [TutorialModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Index"
        populateTutorials()
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func populateTutorials(){
        let wkWebViewTutorial = TutorialModel(name: "WKWebview")
        tutorials.append(wkWebViewTutorial)
        let alertControllerTutorial = TutorialModel(name: "UIAlertController")
        tutorials.append(alertControllerTutorial)
        let localNotificationTutorial = TutorialModel(name: "UILocalNotification")
        tutorials.append(localNotificationTutorial)
        let blurrEffectTutorial = TutorialModel(name: "Blurr Effect")
        tutorials.append(blurrEffectTutorial)
        let motionEffectTutorial = TutorialModel(name: "Motion Effect")
        tutorials.append(motionEffectTutorial)

    }
    
    
    
    func retrieveVCForItem(index:Int)->UIViewController{
        switch(index){
        case 0 :
            return WKWebViewExampleViewController()
        case 1:
            return UIAlertControllerExampleViewController()
        case 2:
            return UILocalNotificationExampleViewController()
        case 3:
            return BlurrEffectExampleViewController()
        case 4:
            return MotionEffectsExampleViewController()
        default:
            break
        }
        return UIViewController()
    }
    
    
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = tutorials[indexPath.row]
                object.destination = retrieveVCForItem(indexPath.row)
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tutorials.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let object = tutorials[indexPath.row]
        cell.textLabel!.text = object.name
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            tutorials.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    
    
    
}

