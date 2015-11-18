//
//  DetailViewController.swift
//  SwiftyWay
//
//  Created by Aldo Rangel on 11/2/15.
//  Copyright © 2015 crimsonrgames. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {


    @IBOutlet weak var containerView: UIView!

    var detailItem: TutorialModel? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let container = self.containerView {
                self.addChildViewController(detail.destination)
                title = detail.name
                //detail.destination.view.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height)
                detail.destination.view.frame = CGRectMake(0, 0, container.frame.size.width, container.frame.size.height);
                container.addSubview(detail.destination.view)
                detail.destination.didMoveToParentViewController(self)
                detail.destination.view.setNeedsLayout()
                
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

