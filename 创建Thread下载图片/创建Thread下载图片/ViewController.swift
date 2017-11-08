//
//  ViewController.swift
//  创建Thread下载图片
//
//  Created by WingChing_Yip on 2017/11/8.
//  Copyright © 2017年 ywc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageView = UIImageView()
    var label = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.frame = CGRect.init(x: 0, y: 100, width: 300, height: 300)
        imageView.center = self.view.center
        self.view.addSubview(imageView)
        
        label.frame = CGRect.init(x: 10, y: 20, width: 100, height: 30)
        label.text = "loading...."
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16.0)
        self.view.addSubview(label)
        
        let imageUrl = "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1458869104,1762549435&fm=27&gp=0.jpg"
        let thread = Thread(target: self, selector: #selector(ViewController.downloadImage(path:)), object: imageUrl)
        thread.start()
    }
    
    @objc func downloadImage(path: String) {
        
        let url = URL(string: path)
        var data : Data!
        do {
            try data = Data(contentsOf: url!)
            let image = UIImage(data: data)
            self.perform(#selector(ViewController.showImage(image:)), on: Thread.main, with: image, waitUntilDone: true)
        } catch  {
            print("下载图片失败！")
        }
    }
    
    @objc func showImage(image : UIImage) {
        
        self.imageView.image = image
        self.label.isHidden = true
    }
 
}

