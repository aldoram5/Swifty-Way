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
        centeredButton.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 75,y: UIScreen.main.bounds.height / 2 - 25,width: 150,height: 50)
        centeredButton.backgroundColor = UIColor.orange
        centeredButton.layer.masksToBounds = true
        centeredButton.setTitle("Press Me!", for: UIControlState())
        centeredButton.setTitleColor(UIColor.white, for: UIControlState())
        centeredButton.layer.cornerRadius = 10.0
        centeredButton.addTarget(self, action: #selector(UIAlertControllerExampleViewController.showAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(centeredButton)
    }
    func showAlert(_ sender: UIButton){
        
        let alert: UIAlertController = UIAlertController(title: "Message", message: "Why do you obey a button, Alice?", preferredStyle: .alert)
        
        let someAction = UIAlertAction(title: "OK", style: .default) { action in
            print("Some Action Occurred")
        }
        
        alert.addAction(someAction)
        
        present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
