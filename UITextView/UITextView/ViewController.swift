//
//  ViewController.swift
//  UITextView
//
//  Created by 周晓磊 on 2019/3/7.
//  Copyright © 2019 LeoZhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    var myTextView: UITextView!
    var secondTextView:UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 使用 UITextView(frame:) 建立一個 UITextView
        // 取得螢幕的尺寸
        let fullScreenSize = UIScreen.main.bounds.size
        myTextView = UITextView(frame: CGRect(x: 0.5 * (fullScreenSize.width - 250), y: 50, width: 250, height: 200))
        // 背景顏色
        myTextView.backgroundColor = UIColor.darkGray
        // 文字顏色
        myTextView.textColor = UIColor.white
        // 文字字型及大小
        myTextView.font = UIFont(name: "Helvetica-Light", size: 20)
        // 文字向左對齊
        myTextView.textAlignment = .left
        // 預設文字內容
        myTextView.text = "Swift 起步走"
        // 適用的鍵盤樣式 這邊選擇預設的
        myTextView.keyboardType = .default
        // 鍵盤上的 return 鍵樣式 這邊選擇預設的
        myTextView.returnKeyType = .default
        // 文字是否可以被編輯
        myTextView.isEditable = true
        // 文字是否可以被選取
        myTextView.isSelectable = true
        myTextView.delegate = self
        
        // 加入畫面
        self.view.addSubview(myTextView)
        
        // 使用 UITextView(frame:) 建立一個 UITextView
        secondTextView = UITextView(frame: CGRect(x: 0.5 * (fullScreenSize.width - 250), y: 300, width: 250, height: 200))
        // 背景顏色
        secondTextView.backgroundColor = UIColor.darkGray
        // 文字顏色
        secondTextView.textColor = UIColor.white
        // 文字字型及大小
        secondTextView.font = UIFont(name: "Helvetica-Light", size: 20)
        // 文字向左對齊
        secondTextView.textAlignment = .left
        // 預設文字內容
        secondTextView.text = "第二个文本"
        // 適用的鍵盤樣式 這邊選擇預設的
        secondTextView.keyboardType = .default
        // 鍵盤上的 return 鍵樣式 這邊選擇預設的
        secondTextView.returnKeyType = .default
        // 文字是否可以被編輯
        secondTextView.isEditable = true
        // 文字是否可以被選取
        secondTextView.isSelectable = true
        secondTextView.delegate = self
        // 加入畫面
        self.view.addSubview(secondTextView)
        
        // 增加一個觸控事件
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(ViewController.hideKeyboard))
        
        tap.cancelsTouchesInView = false
        
        // 加在最基底的 self.view 上
        self.view.addGestureRecognizer(tap)
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        // 建立選單
        let menu = UIMenuController.shared
        
        if textView == myTextView {
            let mail = UIMenuItem(
                title: "寄送",
                action: #selector(ViewController.sendMail))
            menu.menuItems = [mail]
        }else{
            let facebook = UIMenuItem(
                title: "FB",
                action: #selector(ViewController.sendFB))
            menu.menuItems = [facebook]
        }
    }
    @objc func sendMail() {
        print("sendMail")
    }
    
    @objc func sendFB() {
        print("sendFB")
    }
    
    @objc func hideKeyboard(tapG:UITapGestureRecognizer){
        // 除了使用 self.view.endEditing(true)
        // 也可以用 resignFirstResponder()
        // 來針對一個元件隱藏鍵盤
        //self.myTextView.resignFirstResponder()
        self.view.endEditing(true)
    }


}

