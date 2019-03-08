//
//  ViewController.swift
//  UITextField
//
//  Created by 周晓磊 on 2019/3/7.
//  Copyright © 2019 LeoZhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 使用 UITextField(frame:) 建立一個 UITextField
        let myTextField = UITextField(frame: CGRect(x: 0, y: 100, width: 200, height: 50))
        
        // 尚未輸入時的預設顯示提示文字
        myTextField.placeholder = "Please enter your phone number"
        
        // 輸入框的樣式 這邊選擇圓角樣式
        myTextField.borderStyle = .roundedRect
        
        // 輸入框右邊顯示清除按鈕時機 這邊選擇當編輯時顯示
        myTextField.clearButtonMode = .always
        
        // 輸入框適用的鍵盤 這邊選擇 適用輸入 Email 的鍵盤(會有 @ 跟 . 可供輸入)
        myTextField.keyboardType = .emailAddress
        
        // 鍵盤上的 return 鍵樣式 這邊選擇 Done
        myTextField.returnKeyType = .done
        
        // 輸入文字的顏色
        myTextField.textColor = UIColor.black
        
        // UITextField 的背景顏色
        myTextField.backgroundColor = UIColor.white
        
        myTextField.layer.masksToBounds = true
        myTextField.layer.borderColor = UIColor.blue.cgColor
        myTextField.layer.borderWidth = 2
        myTextField.layer.cornerRadius = 5
        myTextField.delegate = self
        
        
        self.view.addSubview(myTextField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }


}

