//
//  ViewController.swift
//  UIImageView
//
//  Created by 周晓磊 on 2019/3/7.
//  Copyright © 2019 LeoZhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fullScreenSize = UIScreen.main.bounds.size
        self.view.backgroundColor = UIColor.black
        
        
        
        // 使用 UIImageView(frame:) 建立一個 UIImageView
        var myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        // 使用 UIImage(named:) 放置圖片檔案
        myImageView.image = UIImage(named: "outline_work.png")
        // 設置新的位置並放入畫面中
        myImageView.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.15)
        self.view.addSubview(myImageView)
        
        
        
        // 使用 UIImageView(image:) 建立一個 UIImageView
        myImageView = UIImageView(image: UIImage(named: "outline_sentiment.png"))
        // 設置原點及尺寸
        myImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        // 設置新的位置並放入畫面中
        myImageView.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.35)
        self.view.addSubview(myImageView)
        
        
        
        // 使用 UIImageView(image:, highlightedImage:)
        // 建立一個 UIImageView
        myImageView = UIImageView(
            image: UIImage(named: "outline_sentiment.png"),
            highlightedImage: UIImage(named: "outline_airplanemode.png"))
        // 設置原點及尺寸
        myImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        // 設置圖片 highlighted 狀態
        myImageView.isHighlighted = false
        // 設置新的位置並放入畫面中
        myImageView.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.55)
        self.view.addSubview(myImageView)
        
        // 建立一個 UIImageView
        myImageView = UIImageView(image: UIImage(named: "outline_pets.png"))
        myImageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        // 設置背景顏色
        myImageView.backgroundColor = UIColor.blue
        // 設置圖片顯示模式
        myImageView.contentMode = .bottomLeft
        // 設置新的位置並放入畫面中
        myImageView.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.8)
        self.view.addSubview(myImageView)
        
        
    }


}

