//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by WingChing_Yip on 2017/11/8.
//  Copyright © 2017年 ywc. All rights reserved.
//

import UIKit

import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let model = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as! User
        model.userName = "小红"
        model.password = "123456"
        do {
            try context.save()
        } catch  {
            fatalError("不能保存:\(error)")
        }
        
        // 查询操作
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "User")
        let fetchedObjects:[User]
        do {
            fetchedObjects = try context.fetch(fetchRequest) as! [User]
            print("查询到的总数为:\(fetchedObjects.count),数据为:\(fetchedObjects)")
        } catch  {
            fatalError("不能保存:\(error)")
        }
        
        // 改
        let xiaohong = fetchedObjects[0]
        xiaohong.password = "8888"
        do {
            try context.save()
        } catch  {
            fatalError("修改不能保存：\(error)")
        }
        
        // 删除
        context.delete(xiaohong)
        do {
            try context.save()
        } catch  {
            fatalError("删除不能保存：\(error)")
        }
    }


}

