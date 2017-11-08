//
//  ViewController.swift
//  使用UIWebView加载HTML字符串
//
//  Created by WingChing_Yip on 2017/11/7.
//  Copyright © 2017年 ywc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var webView:UIWebView!
    var loadHTML:UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadHTML = UIButton.init(frame: .init(x: 20, y: 40, width: 100, height: 44))
        loadHTML.setTitle("加载网页", for: UIControlState.normal)
        loadHTML.setTitleColor(UIColor.blue, for: UIControlState.normal)
        loadHTML.setTitleColor(UIColor.cyan, for: UIControlState.highlighted)
        loadHTML.addTarget(self, action: #selector(ViewController.loadHtmlString), for: UIControlEvents.touchUpInside)
        self.view.addSubview(loadHTML)
        
        webView = UIWebView(frame: .init(x: 0, y: 80, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 80))
        webView.backgroundColor = UIColor.clear
        webView.dataDetectorTypes = [UIDataDetectorTypes.link,UIDataDetectorTypes.phoneNumber]
        self.view.addSubview(webView)
    }
    
    @objc func loadHtmlString() {
        
        let team = "<div style='color: #ff000;font-size: 20px;'>团队名称：酷课堂</div>"
        let tel = "<div>电话：15011122222</div>"
        let url = "<div><b>网址：https://www.apple.com/</b></div>"
        let html = team + tel + url
        
        webView.loadHTMLString(html, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

