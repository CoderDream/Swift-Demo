//
//  RoundView.swift
//  编写自定义视图
//
//  Created by WingChing_Yip on 2017/11/7.
//  Copyright © 2017年 ywc. All rights reserved.
//

import Foundation

import UIKit

class RoundView: UIView {
    
    var color = UIColor.blue
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) {
        
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.clear(self.frame)
        ctx?.setFillColor(color.cgColor)
        ctx?.fillEllipse(in: .init(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
