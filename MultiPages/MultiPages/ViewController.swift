//
//  ViewController.swift
//  MultiPages
//
//  Created by 周晓磊 on 2019/3/8.
//  Copyright © 2019 LeoZhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 取得螢幕的尺寸
        let fullSize = UIScreen.main.bounds.size
        
        // 設置底色
        self.view.backgroundColor = UIColor.white
        
        // 頁面標題
        let myLabel = UILabel(frame: CGRect(
            x: 0, y: 0, width: fullSize.width, height: 40))
        myLabel.center = CGPoint(
            x: fullSize.width * 0.5, y: fullSize.height * 0.08)
        myLabel.textAlignment = .center
        myLabel.text = "首頁"
        self.view.addSubview(myLabel)
        
        // 建立前往 Article 頁面的 UIButton
        var myButton = UIButton(frame: CGRect(
            x: 0, y: 0, width: 100, height: 30))
        myButton.setTitle("Article", for: .normal)
        myButton.backgroundColor = UIColor.lightGray
        myButton.addTarget(
            nil, action: #selector(ViewController.goArticle),
            for: .touchUpInside)
        myButton.center = CGPoint(
            x: fullSize.width * 0.5, y: fullSize.height * 0.2)
        self.view.addSubview(myButton)
        
        // 建立前往 Intro 頁面的 UIButton
        myButton = UIButton(frame: CGRect(
            x: 0, y: 0, width: 100, height: 30))
        myButton.setTitle("Intro", for: .normal)
        myButton.backgroundColor = UIColor.lightGray
        myButton.addTarget(nil,
                           action: #selector(ViewController.goIntro),
                           for: .touchUpInside)
        myButton.center = CGPoint(
            x: fullSize.width * 0.5, y: fullSize.height * 0.4)
        self.view.addSubview(myButton)
    }

    @objc func goArticle() {
        self.present(ArticleViewController(), animated: true, completion: nil)
    }
    
    @objc func goIntro() {
        self.present(IntroViewController(), animated: true, completion: nil)
    }
}

