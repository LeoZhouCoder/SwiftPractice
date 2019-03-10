//
//  ViewController.swift
//  UINavigationController
//
//  Created by Leo Zhou on 2019/3/8.
//  Copyright © 2019 LeoZhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.darkGray
        self.title = "首頁"
        self.navigationController!.navigationBar.barTintColor = UIColor.lightGray
        self.navigationController!.navigationBar.isTranslucent = false
        
        // 導覽列左邊按鈕
        let leftButton = UIBarButtonItem(
            image: UIImage(named:"01"),
            style:.plain ,
            target:self ,
            action: #selector(ViewController.check))
        self.navigationItem.leftBarButtonItem = leftButton
        
        // 導覽列右邊按鈕
        let rightButton = UIBarButtonItem(
            title:"設定",
            style:.plain,
            target:self,
            action:#selector(ViewController.setting))
        self.navigationItem.rightBarButtonItem = rightButton
        
        // 建立一個按鈕
        let myButton = UIButton(frame: CGRect(
            x: 0, y: 0, width: 120, height: 40))
        myButton.setTitle("Article", for: .normal)
        myButton.backgroundColor = UIColor.blue
        myButton.addTarget(
            self,
            action: #selector(ViewController.article),
            for: .touchUpInside)
        self.view.addSubview(myButton)
    }
    
    @objc func article() {
        self.navigationController?.pushViewController(ArticleViewController(), animated: true)
    }
    
    @objc func check() {
        print("check button action")
    }
    
    @objc func setting() {
        self.navigationController?.pushViewController(SettingViewController(), animated: true)
    }

}

