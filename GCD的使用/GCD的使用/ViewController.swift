//
//  ViewController.swift
//  GCD的使用
//
//  Created by WingChing_Yip on 2017/11/9.
//  Copyright © 2017年 ywc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /**
            并发：多个任务同时执行
            串行：一个任务执行完成后，再执行下一个任务
            同步：在当前线程中执行任务，不会开启新线程
            异步: 在新的线程中执行任务
         **/
        
        // 使用GCD查询IP地址信息
        label.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 568)
        label.text = "loading..."
        label.font = UIFont(name: "Arial", size: 17.0)
        label.backgroundColor = UIColor.orange
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        self.view.addSubview(label)
        
        let apiURL = URL(string: "https://www.apple.com/iphone-x/")
        let globalQueue = DispatchQueue.global() // 调度全局队列
        globalQueue.async {
            
            let result = try? Data(contentsOf: apiURL!)
            let message = String(data: result!, encoding: String.Encoding.utf8)
            DispatchQueue.main.async {
                self.label.text = message
            }
        }
        
        
    }
}

