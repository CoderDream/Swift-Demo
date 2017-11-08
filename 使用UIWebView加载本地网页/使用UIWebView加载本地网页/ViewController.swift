//
//  ViewController.swift
//  使用UIWebView加载本地网页
//
//  Created by WingChing_Yip on 2017/11/7.
//  Copyright © 2017年 ywc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var getInfoBtn:UIButton!
    var submitFormBtn:UIButton!
    var webView:UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getInfoBtn = UIButton.init(frame: .init(x: 20, y: 64, width: 120, height: 44))
        getInfoBtn.setTitle("获得页面信息", for: .normal)
        getInfoBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        getInfoBtn.setTitleColor(UIColor.blue, for: .normal)
        getInfoBtn.setTitleColor(UIColor.cyan, for: .highlighted)
        getInfoBtn.addTarget(self, action: #selector(ViewController.getInfo), for: .touchUpInside)
        self.view.addSubview(getInfoBtn)
        
        submitFormBtn = UIButton.init(frame: .init(x: 160, y: 64, width: 120, height: 44))
        submitFormBtn.setTitle("设置并提交表单", for: .normal)
        submitFormBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        submitFormBtn.setTitleColor(UIColor.blue, for: .normal)
        submitFormBtn.setTitleColor(UIColor.cyan, for: .highlighted)
        submitFormBtn.addTarget(self, action: #selector(ViewController.submitForm), for: .touchUpInside)
        self.view.addSubview(submitFormBtn)
        
        webView = UIWebView.init(frame: .init(x: 0, y: 128, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 128))
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "index", ofType: "html")!)
        webView.loadRequest(URLRequest(url: url))
        self.view.addSubview(webView)
    }
    
    @objc func getInfo() {
        
        let url = webView.stringByEvaluatingJavaScript(from: "document.location.href")
        let title = webView.stringByEvaluatingJavaScript(from: "document.title")
        print("url:\(String(describing: url)),title:\(String(describing: title))")
        
    }
    
    @objc func submitForm() {
        
        let firstJs = "document.getElementById('userName').value = 'Jerry'"
        let secondJs = "submitForm()"
        webView.stringByEvaluatingJavaScript(from: firstJs)
        webView.stringByEvaluatingJavaScript(from: secondJs)
    }
}

