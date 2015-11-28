//
//  MotionEffectsExampleViewController.swift
//  SwiftyWay
//
//  Created by Aldo Rangel on 11/17/15.
//  Copyright © 2015 crimsonrgames. All rights reserved.
//

import UIKit

class MotionEffectsExampleViewController: UIViewController {

    var photoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSimpleImageView()
        view.backgroundColor = UIColor.blackColor()
        addMotionEffectToImageView()
    }

    
    func addSimpleImageView(){
        photoView = UIImageView(frame: CGRectMake(40,40,200,160))
        
        let myImage = UIImage(named: "milky-way-923801_640.jpg")
        
        photoView.image = myImage
        
        self.view.addSubview(photoView)
        
    }
    
    func addMotionEffectToImageView(){
        
        let constantValue = 40
        
        // Set Vertical effect
        let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y",
            type: .TiltAlongVerticalAxis)
        verticalMotionEffect.minimumRelativeValue = -constantValue
        verticalMotionEffect.maximumRelativeValue = constantValue
        
        // Set horizontal effect
        let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x",
            type: .TiltAlongHorizontalAxis)
        horizontalMotionEffect.minimumRelativeValue = -constantValue
        horizontalMotionEffect.maximumRelativeValue = constantValue
        
        // Create group to combine both
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
        photoView.addMotionEffect(group)
        photoView.contentMode = UIViewContentMode.Center
    
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
