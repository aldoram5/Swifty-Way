//
//  WKWebViewExampleViewController.swift
//  SwiftyWay
//
//  Created by Aldo Rangel on 11/2/15.
//  Copyright © 2015 crimsonrgames. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class WKWebViewExampleViewController:  UIViewController, WKNavigationDelegate{
    var destinationUrl: String = "https://www.google.com/"
    var webView: WKWebView!
    var maskView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createWKWebView()
        loadDestinationUrl()
        addMaskView()
    }
    
    
    func createWKWebView(){
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height ))
        view.addSubview(webView)
        webView.navigationDelegate = self
        
        
    }
    
    func loadDestinationUrl(){
        webView.load(URLRequest(url: URL(string: destinationUrl)!, cachePolicy: NSURLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval:100.0))

    }
    
    func addMaskView(){
        maskView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width + 10, height: view.frame.height + 10 ))
        if let mask = maskView{
            mask.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
            let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
            activityIndicator.center = mask.center
            activityIndicator.startAnimating()
            mask.addSubview(activityIndicator)
            view.addSubview(mask)
            view.bringSubview(toFront: mask)
        }
        
    }
    
    func hideMaskView(){
        if let mask = maskView{
            mask.isHidden = true
        }
    }
    
    func showMaskView(){
        if let mask = maskView{
            mask.isHidden = false
        }

    }
    
    // MARK: - MemoryWarning
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        URLCache.shared.removeAllCachedResponses()
    }
    
    
    // MARK: - WK Navigation Delegate

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if(!webView.isLoading){
            hideMaskView()
        }
    }
    
    
}
