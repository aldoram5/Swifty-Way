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
    
    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
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
        let socialSharingTutorial = TutorialModel(name: "Social")
        tutorials.append(socialSharingTutorial)

    }
    
    
    
    func retrieveVCForItem(_ index:Int)->UIViewController{
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
        case 5:
            return CommonSharingExampleViewController()
        default:
            break
        }
        return UIViewController()
    }
    
    
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = tutorials[indexPath.row]
                object.destination = retrieveVCForItem(indexPath.row)
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tutorials.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let object = tutorials[indexPath.row]
        cell.textLabel!.text = object.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tutorials.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    
    
    
}

