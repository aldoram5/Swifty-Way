//
//  BlurrEffectExampleViewController.swift
//  SwiftyWay
//
//  Created by Aldo Rangel on 11/17/15.
//  Copyright © 2015 crimsonrgames. All rights reserved.
//

import UIKit

class BlurrEffectExampleViewController: UIViewController {

    var photoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSimpleImageView()
        addSimpleButtonToCenter()
        // Do any additional setup after loading the view.
    }
    
    func addSimpleImageView(){
        photoView = UIImageView(frame: CGRectMake(40,40,160,120))
        
        let myImage = UIImage(named: "hat-885402_640.jpg")
        
        photoView.image = myImage
        photoView.layer.cornerRadius = 20
        photoView.clipsToBounds = true
        
        self.view.addSubview(photoView)
    
    }
    
    func addSimpleButtonToCenter(){
        
        let centeredButton: UIButton = UIButton()
        centeredButton.frame = CGRectMake(UIScreen.mainScreen().bounds.width / 2 - 75,UIScreen.mainScreen().bounds.height / 2 - 25,150,50)
        centeredButton.backgroundColor = UIColor.redColor()
        centeredButton.layer.masksToBounds = true
        centeredButton.setTitle("Blurr the Image!", forState: UIControlState.Normal)
        centeredButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        centeredButton.layer.cornerRadius = 10.0
        centeredButton.addTarget(self, action: "addBlurrEffectViewToImage", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(centeredButton)
    }
    
    func addBlurrEffectViewToImage(){

        var effectV: UIVisualEffectView!
        let blurEffect: UIVisualEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        effectV = UIVisualEffectView(effect: blurEffect)
        effectV.frame = photoView.frame
        effectV.layer.masksToBounds = true
        effectV.layer.cornerRadius = 20
        view.addSubview(effectV)

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
