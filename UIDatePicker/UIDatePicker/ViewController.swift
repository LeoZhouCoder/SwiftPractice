//
//  ViewController.swift
//  UIDatePicker
//
//  Created by 周晓磊 on 2019/3/7.
//  Copyright © 2019 LeoZhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myDatePicker: UIDatePicker!
    var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fullScreenSize = UIScreen.main.bounds.size
        
        
        // 使用 UIDatePicker(frame:) 建立一個 UIDatePicker
        myDatePicker = UIDatePicker(frame: CGRect(
            x: 0, y: 0,
            width: fullScreenSize.width, height: 100))
        
        // 設置 UIDatePicker 格式
        myDatePicker.datePickerMode = .dateAndTime
        
        // 選取時間時的分鐘間隔 這邊以 15 分鐘為一個間隔
        myDatePicker.minuteInterval = 15
        
        // 設置預設時間為現在時間
        myDatePicker.date = Date()
        
        // 設置 NSDate 的格式
        let formatter = DateFormatter()
        
        // 設置時間顯示的格式
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        // 可以選擇的最早日期時間
        let fromDateTime = formatter.date(from: "2016-01-02 18:08")
        
        // 設置可以選擇的最早日期時間
        myDatePicker.minimumDate = fromDateTime
        
        // 可以選擇的最晚日期時間
        let endDateTime = formatter.date(from: "2017-12-25 10:45")
        
        // 設置可以選擇的最晚日期時間
        myDatePicker.maximumDate = endDateTime
        
        // 設置顯示的語言環境
        myDatePicker.locale = Locale(identifier: "zh_CN")
        
        // 設置改變日期時間時會執行動作的方法
        myDatePicker.addTarget(self,
                               action:
            #selector(ViewController.datePickerChanged),
                               for: .valueChanged)
        
        // 設置位置並加入到畫面中
        myDatePicker.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.4)
        self.view.addSubview(myDatePicker)
        
        
        // 建立一個 UILabel 來顯示改變日期時間後的結果
        myLabel = UILabel(frame: CGRect(
            x: 0, y: 0,
            width: fullScreenSize.width, height: 50))
        myLabel.backgroundColor = UIColor.lightGray
        myLabel.textAlignment = .center
        myLabel.textColor = UIColor.black
        myLabel.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.15)
        self.view.addSubview(myLabel)
    }
    
    @objc func datePickerChanged(datePicker:UIDatePicker) {
        // 設置要顯示在 UILabel 的日期時間格式
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        // 更新 UILabel 的內容
        myLabel.text = formatter.string(
            from: datePicker.date)
    }

}

