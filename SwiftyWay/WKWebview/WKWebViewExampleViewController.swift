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
        webView.loadRequest(NSURLRequest(URL: NSURL(string: destinationUrl)!, cachePolicy: NSURLRequestCachePolicy.UseProtocolCachePolicy, timeoutInterval:100.0))

    }
    
    func addMaskView(){
        maskView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width + 10, height: view.frame.height + 10 ))
        if let mask = maskView{
            mask.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
            let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
            activityIndicator.center = mask.center
            activityIndicator.startAnimating()
            mask.addSubview(activityIndicator)
            view.addSubview(mask)
            view.bringSubviewToFront(mask)
        }
        
    }
    
    func hideMaskView(){
        if let mask = maskView{
            mask.hidden = true
        }
    }
    
    func showMaskView(){
        if let mask = maskView{
            mask.hidden = false
        }

    }
    
    // MARK: - MemoryWarning
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        NSURLCache.sharedURLCache().removeAllCachedResponses()
    }
    
    
    // MARK: - WK Navigation Delegate
    
    func webViewDidStartLoad(webView: UIWebView) {
        print("WebView Started loading")
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        
        print("WebView Failed")
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        if(!webView.loading){
            hideMaskView()
        }
    }
    
    
}