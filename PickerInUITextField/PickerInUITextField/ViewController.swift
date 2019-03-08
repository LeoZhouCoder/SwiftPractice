//
//  ViewController.swift
//  PickerInUITextField
//
//  Created by 周晓磊 on 2019/3/7.
//  Copyright © 2019 LeoZhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return meals.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return meals[row]
    }
    // UIPickerView 改變選擇後執行的動作
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int, inComponent component: Int) {
        // 依據元件的 tag 取得 UITextField
        let myTextField =
            self.view?.viewWithTag(100) as? UITextField
        
        // 將 UITextField 的值更新為陣列 meals 的第 row 項資料
        myTextField?.text = meals[row]
    }

    let meals = ["早餐","午餐","晚餐","宵夜"]
    var formatter: DateFormatter! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fullScreenSize = UIScreen.main.bounds.size
        
        // 建立一個 UITextField
        var myTextField = UITextField(frame: CGRect(
            x: 0, y: 0,
            width: fullScreenSize.width, height: 40))
        
        // 建立 UIPickerView
        let myPickerView = UIPickerView()
        
        // 設定 UIPickerView 的 delegate 及 dataSource
        myPickerView.delegate = self
        myPickerView.dataSource = self
        
        // 將 UITextField 原先鍵盤的視圖更換成 UIPickerView
        myTextField.inputView = myPickerView
        
        // 設置 UITextField 預設的內容
        myTextField.text = meals[0]
        
        // 設置 UITextField 的 tag 以利後續使用
        myTextField.tag = 100
        
        // 設置 UITextField 其他資訊並放入畫面中
        myTextField.backgroundColor = UIColor.init(
            red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        myTextField.textAlignment = .center
        myTextField.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.15)
        self.view.addSubview(myTextField)
        
        
        // 建立另一個 UITextField
        myTextField = UITextField(frame: CGRect(
            x: 0, y: 0,
            width: fullScreenSize.width, height: 40))
        
        // 初始化 formatter 並設置日期顯示的格式
        formatter = DateFormatter()
        formatter.dateFormat = "yyyy 年 MM 月 dd 日"
        
        // 建立一個 UIDatePicker
        let myDatePicker = UIDatePicker()
        
        // 設置 UIDatePicker 格式
        myDatePicker.datePickerMode = .date
        
        // 設置 UIDatePicker 顯示的語言環境
        myDatePicker.locale = Locale(identifier: "zh_CN")
        
        // 設置 UIDatePicker 預設日期為現在日期
        myDatePicker.date = Date()
        
        // 設置 UIDatePicker 改變日期時會執行動作的方法
        myDatePicker.addTarget(
            self,
            action:
            #selector(ViewController.datePickerChanged),
            for: .valueChanged)
        
        // 將 UITextField 原先鍵盤的視圖更換成 UIDatePicker
        myTextField.inputView = myDatePicker
        
        // 設置 UITextField 預設的內容
        myTextField.text =
            formatter.string(from: myDatePicker.date)
        
        // 設置 UITextField 的 tag 以利後續使用
        myTextField.tag = 200
        
        // 設置 UITextField 其他資訊並放入畫面中
        myTextField.backgroundColor = UIColor.init(
            red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        myTextField.textAlignment = .center
        myTextField.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.25)
        self.view.addSubview(myTextField)
        
        
        // 增加一個觸控事件
        let tap = UITapGestureRecognizer(
            target: self,
            action:
            #selector(ViewController.hideKeyboard))
        
        tap.cancelsTouchesInView = false
        
        // 加在最基底的 self.view 上
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func datePickerChanged(datePicker:UIDatePicker) {
        // 依據元件的 tag 取得 UITextField
        let myTextField =
            self.view?.viewWithTag(200) as? UITextField
        
        // 將 UITextField 的值更新為新的日期
        myTextField?.text =
            formatter.string(from: datePicker.date)
    }
    
    @objc func hideKeyboard(tapG:UITapGestureRecognizer){
        self.view.endEditing(true)
    }

}

