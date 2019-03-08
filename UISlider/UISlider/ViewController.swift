//
//  ViewController.swift
//  UISlider
//
//  Created by 周晓磊 on 2019/3/7.
//  Copyright © 2019 LeoZhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView :UIImageView!
    var mySlider :UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 取得螢幕的尺寸
        let fullScreenSize = UIScreen.main.bounds.size
        self.view.backgroundColor = UIColor.black
        
        // 建立一個 UIImageView
        imageView = UIImageView(image: UIImage(named: "01"))
        imageView.contentMode = .scaleToFill
        imageView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        imageView.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.3)
        self.view.addSubview(imageView)
        
        
        
        // 建立一個 UISlider
        mySlider=UISlider(frame: CGRect(
            x: 0, y: 0, width:
            fullScreenSize.width * 0.9, height: 50))
        
        // UISlider 底色
        mySlider.backgroundColor = UIColor.lightGray
        
        // UISlider 滑桿按鈕右邊 尚未填滿的顏色
        mySlider.maximumTrackTintColor = UIColor.orange
        
        // UISlider 滑桿按鈕左邊 已填滿的顏色
        mySlider.minimumTrackTintColor = UIColor.purple
        
        // UISlider 滑桿按鈕的顏色
        mySlider.thumbTintColor = UIColor.brown
        
        // UISlider 的最小值
        mySlider.minimumValue = 0
        
        // UISlider 的最大值
        mySlider.maximumValue = 100
        
        // UISlider 預設值
        mySlider.value = 100
        
        // UISlider 是否可以在變動時同步執行動作
        // 設定 false 時 則是滑動完後才會執行動作
        mySlider.isContinuous = true
        
        // UISlider 滑動滑桿時執行的動作
        mySlider.addTarget(
            self,
            action:
            #selector(ViewController.onSliderChange),
            for: .valueChanged)
        
        // 設置位置並放入畫面中
        mySlider.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.65)
        self.view.addSubview(mySlider)
    }
    
    @objc func onSliderChange() {
        // 設置圖片的透明度
        imageView.alpha = CGFloat(
            mySlider.value / mySlider.maximumValue)
    }
}

