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
        photoView = UIImageView(frame: CGRect(x: 40,y: 40,width: 160,height: 120))
        
        let myImage = UIImage(named: "hat-885402_640.jpg")
        
        photoView.image = myImage
        photoView.layer.cornerRadius = 20
        photoView.clipsToBounds = true
        
        self.view.addSubview(photoView)
    
    }
    
    func addSimpleButtonToCenter(){
        
        let centeredButton: UIButton = UIButton()
        centeredButton.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 75,y: UIScreen.main.bounds.height / 2 - 25,width: 150,height: 50)
        centeredButton.backgroundColor = UIColor.red
        centeredButton.layer.masksToBounds = true
        centeredButton.setTitle("Blurr the Image!", for: UIControlState())
        centeredButton.setTitleColor(UIColor.white, for: UIControlState())
        centeredButton.layer.cornerRadius = 10.0
        centeredButton.addTarget(self, action: #selector(BlurrEffectExampleViewController.addBlurrEffectViewToImage), for: .touchUpInside)
        
        self.view.addSubview(centeredButton)
    }
    
    func addBlurrEffectViewToImage(){

        var effectV: UIVisualEffectView!
        let blurEffect: UIVisualEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
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
