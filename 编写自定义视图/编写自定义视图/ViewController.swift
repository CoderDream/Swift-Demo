//
//  ViewController.swift
//  编写自定义视图
//
//  Created by WingChing_Yip on 2017/11/7.
//  Copyright © 2017年 ywc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 自定义视图
        let view = RoundView(frame: .init(x: 0, y: 40, width: 240, height: 240))
        view.color = UIColor.green
        self.view.addSubview(view)
        
        let gradient = UIView(frame: .init(x: 0, y: 300, width: 100, height: 100))
    
        self.view.addSubview(gradient)
        
        // 添加渐变效果
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradient.frame
        gradientLayer.colors = [UIColor.cyan.cgColor,UIColor.blue.cgColor,UIColor.green.cgColor]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 1)
        gradientLayer.locations = [0 , 0.3 , 1]
        gradient.layer.addSublayer(gradientLayer)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

