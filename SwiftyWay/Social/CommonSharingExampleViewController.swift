//
//  CommonSharingExampleViewController
//  SwiftyWay
//
//  Created by Aldo Rangel on 03/15/17.
//  Copyright © 2017 crimsonrgames. All rights reserved.
//

import UIKit
import Social

class CommonSharingExampleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButtons()
    }
    
    func addButtons(){
        let facebookButton: UIButton = UIButton()
        facebookButton.frame = CGRect(x: UIScreen.main.bounds.width / 4 - 45, y: UIScreen.main.bounds.height / 2 - 20, width: 90, height: 40)
        facebookButton.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        facebookButton.layer.masksToBounds = true
        facebookButton.setTitle("Facebook", for: UIControlState())
        facebookButton.setTitleColor(UIColor.white, for: .normal)
        facebookButton.layer.cornerRadius = 10.0
        facebookButton.addTarget(self, action: #selector(CommonSharingExampleViewController.shareWithFacebook), for: .touchUpInside)
        
        let twitterButton: UIButton = UIButton()
        twitterButton.frame = CGRect(x: (2 * UIScreen.main.bounds.width ) / 4 - 45, y: UIScreen.main.bounds.height / 2 - 20, width: 90, height: 40)
        twitterButton.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        twitterButton.layer.masksToBounds = true
        twitterButton.setTitle("Twitter", for: UIControlState())
        twitterButton.setTitleColor(UIColor.white, for: .normal)
        twitterButton.layer.cornerRadius = 10.0
        twitterButton.addTarget(self, action: #selector(CommonSharingExampleViewController.shareWithTwitter), for: .touchUpInside)
        
        let airDropButton: UIButton = UIButton()
        airDropButton.frame = CGRect(x: ( 3 * UIScreen.main.bounds.width) / 4 - 45,y: UIScreen.main.bounds.height / 2 - 20, width: 90, height: 40)
        airDropButton.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        airDropButton.layer.masksToBounds = true
        airDropButton.setTitle("AirDrop", for: UIControlState())
        airDropButton.setTitleColor(UIColor.white, for: .normal)
        airDropButton.layer.cornerRadius = 10.0
        airDropButton.addTarget(self, action: #selector(CommonSharingExampleViewController.shareWithAirDrop(_:)), for: .touchUpInside)
        
        self.view.addSubview(facebookButton)
        self.view.addSubview(twitterButton)
        self.view.addSubview(airDropButton)
    
    }
    
    func shareWithAirDrop(_ sender: AnyObject) {
        if let button = sender as? UIView {
            if let url = URL(string: "https://crimsonrgames.com/") {
                let vc = UIActivityViewController(activityItems: [url], applicationActivities: [])
                vc.popoverPresentationController?.sourceView = button
                vc.popoverPresentationController?.sourceRect = button.bounds
                present(vc, animated: true)
            }
        }
    }
    
    func shareWithFacebook(){
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
            let facebookShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookShare.add(URL(string: "https://crimsonrgames.com/"))
            facebookShare.setInitialText("Shared using the social framework")
            self.present(facebookShare, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to Facebook with your device", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func shareWithTwitter(){
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
            let twitterShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitterShare.setInitialText("Shared using the social framework")
            twitterShare.add(URL(string: "https://crimsonrgames.com/"))
            self.present(twitterShare, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to Twitter with your device", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
