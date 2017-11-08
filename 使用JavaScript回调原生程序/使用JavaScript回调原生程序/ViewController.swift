//
//  ViewController.swift
//  使用JavaScript回调原生程序
//
//  Created by WingChing_Yip on 2017/11/7.
//  Copyright © 2017年 ywc. All rights reserved.

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {

    var webView:UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView = UIWebView(frame: .init(x: 0, y: 40, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 40))
        webView.backgroundColor = UIColor.clear
        webView.delegate = self
        self.view.addSubview(webView)
        
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "index", ofType: "html")!)
        webView.loadRequest(URLRequest(url: url))
    }

    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        let url = request.url?.absoluteString
        print("url:\(url)")
        let components = url?.components(separatedBy: ":")
        let firstElement = components?[0]
        if (components?.count)! > 1 && firstElement! == "callios" {
            
            let model = UIDevice.current.model
            let systemName = UIDevice.current.systemName
            let systemVersion = UIDevice.current.systemVersion
            let message = "设备类型:" + model + "\\n系统类型:" + systemName + "\\系统版本:" + systemVersion
            
            webView.stringByEvaluatingJavaScript(from: "alert('" + message + "')")
        }
        return true
    }
}

