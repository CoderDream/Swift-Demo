//
//  ViewController.swift
//  Operation技术的使用
//
//  Created by WingChing_Yip on 2017/11/9.
//  Copyright © 2017年 ywc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var topImageView = UIImageView()
    var footImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topImageView.frame = CGRect.init(x: 0, y: 0, width: 320, height: 280)
        self.view.addSubview(topImageView)
        
        footImageView.frame = CGRect.init(x: 0, y: 280, width: 320, height: 290)
        self.view.addSubview(footImageView)
        
        let downloadA = getOperation(name: "下载线程A", imageUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1510229397950&di=8398d86e638f338b922125ce10003f98&imgtype=0&src=http%3A%2F%2Fpic.chinaz.com%2F2017%2F1104%2F17110415102512721.jpg", isTopOne: true)
        let downloadB = getOperation(name: "下载线程B", imageUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1510229397950&di=791a8bbbe51809b51da749e63f03f7ad&imgtype=0&src=http%3A%2F%2Fpic.chinaz.com%2F2017%2F1106%2F17110621450324814.jpg", isTopOne: false)
        let queue = OperationQueue()
        
        // 设置并发操作数为1（同一个时间点内只执行一个线程），从而使队列中的线程按照顺序依次执行
        queue.maxConcurrentOperationCount = 1
        queue.addOperation(downloadA)
        queue.addOperation(downloadB)
        for operation in queue.operations {
            print("Operation名称:" + operation.name!)
        }
    }
    
    func getOperation(name: String, imageUrl: String, isTopOne: Bool) -> BlockOperation {
        
        let download = BlockOperation {
            
            let url = URL(string: imageUrl)
            var data : Data!
            
            do {
                
                Thread.sleep(forTimeInterval: 1.0)
                try data = Data(contentsOf: url!)
                let image = UIImage(data: data)
                if isTopOne {
                    
                    self.perform(#selector(ViewController.showTopImage(image:)), on: Thread.main, with: image, waitUntilDone: true)
                }
                else {
                    
                    self.perform(#selector(ViewController.showFootImage(image:)), on: Thread.main, with: image, waitUntilDone: true)
                }
                
            }catch {
                
                print("下载图片失败.")
            }
        }
        
        download.name = name
        return download
    }
    
    @objc func showTopImage(image: UIImage) {
        
        self.topImageView.image =  image
    }

    @objc func showFootImage(image: UIImage) {
        
        self.footImageView.image = image
    }
}

