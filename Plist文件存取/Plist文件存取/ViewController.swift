//
//  ViewController.swift
//  Plist文件存取
//
//  Created by WingChing_Yip on 2017/11/7.
//  Copyright © 2017年 ywc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let plistPath = Bundle.main.path(forResource: "demoPlist", ofType: "plist")
        
        let data:NSMutableDictionary = NSMutableDictionary.init(contentsOfFile: plistPath!)!
        let message = data.description
        let name = data["Name"] as! String
        let age = data["Age"] as! NSNumber
        
        print("before:\(message)")
        print("before:\(name)")
        print("before:\(age)")
        
        let dic:NSMutableDictionary = NSMutableDictionary()
        dic.setObject("Bruce", forKey: "Name" as NSCopying)
        dic.setObject(22, forKey: "Age" as NSCopying)
        dic.write(to: URL.init(fileURLWithPath: plistPath!), atomically: true)
        
        let dataBlack:NSMutableDictionary = NSMutableDictionary.init(contentsOfFile: plistPath!)!
        let messageBlack = dataBlack.description
        print("back:\(messageBlack)")
        print(plistPath)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

