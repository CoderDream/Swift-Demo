//
//  ViewController.swift
//  UIWebViewDemo
//
//  Created by WingChing_Yip on 2017/11/7.
//  Copyright © 2017年 ywc. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let webView = UIWebView.init(frame: self.view.bounds)
        webView.delegate = self
        webView.backgroundColor = UIColor.clear
        
        let urlQuest = NSURLRequest(url: URL(string: "https://www.apple.com/")!)
        webView.loadRequest(urlQuest as URLRequest)
        
        self.view.addSubview(webView)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

