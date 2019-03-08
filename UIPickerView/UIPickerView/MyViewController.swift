//
//  MyViewController.swift
//  UIPickerView
//
//  Created by 周晓磊 on 2019/3/7.
//  Copyright © 2019 LeoZhou. All rights reserved.
//

import UIKit

class MyViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    let week = [
        "星期日","星期一","星期二","星期三",
        "星期四","星期五","星期六"]
    let meals = ["早餐","午餐","晚餐","宵夜"]
    var whatDay = "星期日"
    var whatMeal = "早餐"
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? week.count : meals.count
    }
    
    // UIPickerView 每個選項顯示的資料
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int, forComponent component: Int)
        -> String? {
            if component == 0 {
                return week[row]
            }else{
                return meals[row]
            }
    }
    // UIPickerView 改變選擇後執行的動作
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            whatDay = week[row]
        } else {
            whatMeal = meals[row]
        }
        print("選擇的是 \(whatDay) ， \(whatMeal)")
    }
    
}
