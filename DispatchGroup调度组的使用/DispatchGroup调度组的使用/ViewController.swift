//
//  ViewController.swift
//  DispatchGroup调度组的使用
//
//  Created by WingChing_Yip on 2017/11/9.
//  Copyright © 2017年 ywc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 当完成三个事情后，再调用另一个方法隐藏loading动画
        print("开启任务，并显示loading...动画")
        
        // 创建调度组对象
        let group = DispatchGroup()
        let globalQueue = DispatchQueue.global()
        
        globalQueue.async(group: group, execute: {
            
            print("从远程服务器加载用户头像")
        })
        
        globalQueue.async(group: group, execute: {
            
            print("根据用户id获得年度所有的交易额记录")
        })
        
        globalQueue.async(group: group, execute: {
            
            print("根据用户id获得所有被用户收藏的商品名称")
        })
        
        // 通过group对象的notify方法，监听三个任务完成的状态，当三个任务全部完成后，在一个block中执行接下来的业务逻辑
        group.notify(queue: globalQueue, execute: {
            
            print("完成所有任务，隐藏loading...")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

