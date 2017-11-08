//
//  ViewController.swift
//  给Thread加锁使线程同步
//
//  Created by WingChing_Yip on 2017/11/8.
//  Copyright © 2017年 ywc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 书的数量
    var booksCount = 100
    // 销售书的数量
    var soldBooksCount = 0
    // 锁
    var lock : NSLock!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lock = NSLock()
        
        let salesmanA = Thread(target: self, selector: #selector(ViewController.sellBook), object: nil)
        salesmanA.name = "销售员甲"
        salesmanA.start()
        
        let salesmanB = Thread(target: self, selector: #selector(ViewController.sellBook), object: nil)
        salesmanB.name = "销售员乙"
        salesmanB.start()
        
        let salesmanC = Thread(target: self, selector: #selector(ViewController.sellBook), object: nil)
        salesmanC.name = "销售员丙"
        salesmanC.start()
    }

    @objc func sellBook() {
        
        while true {
            
            // 调用lock对象的lock方法，使线程处于互斥的同步状态，保证此时只有一个线程在执行lock方法和unlock方法之间的代码
            lock.lock()
            if booksCount > 0  {
                
                Thread.sleep(forTimeInterval: 0.01)
                soldBooksCount += 1
                booksCount -= 1
                let threadName = Thread.current.name
                print("当前销售员为:\(threadName),此时已售书：\(soldBooksCount)本,还剩余：\(booksCount)本")
            }
            else {
                
                Thread.exit()
            }
            lock.unlock()
        }
    }

}

