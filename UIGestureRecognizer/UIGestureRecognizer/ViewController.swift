//
//  ViewController.swift
//  UIGestureRecognizer
//
//  Created by Leo Zhou on 2019/3/9.
//  Copyright © 2019 LeoZhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var fullSize :CGSize!
    var myUIView :UIView!
    var anotherUIView :UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullSize = UIScreen.main.bounds.size
        
        
        let doubleFingers = UITapGestureRecognizer(
            target:self,
            action:#selector(ViewController.doubleTap))
        
        doubleFingers.numberOfTapsRequired = 1
        doubleFingers.numberOfTouchesRequired = 2
        self.view.addGestureRecognizer(doubleFingers)
        
        
        let singleFinger = UITapGestureRecognizer(
            target:self,
            action:#selector(ViewController.singleTap))
        singleFinger.numberOfTapsRequired = 2
        singleFinger.numberOfTouchesRequired = 1
        singleFinger.require(toFail: doubleFingers)
        self.view.addGestureRecognizer(singleFinger)
        
        
        let longPress = UILongPressGestureRecognizer(
            target: self,
            action: #selector(ViewController.longPress))
        self.view.addGestureRecognizer(longPress)
        
        
        myUIView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        myUIView.backgroundColor = UIColor.blue
        self.view.addSubview(myUIView)
        
        
        let swipeUp = UISwipeGestureRecognizer(
            target:self,
            action:#selector(ViewController.swipe))
        swipeUp.direction = .up
        swipeUp.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(swipeUp)
        
        
        let swipeLeft = UISwipeGestureRecognizer(
            target:self,
            action:#selector(ViewController.swipe))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        
        let swipeDown = UISwipeGestureRecognizer(
            target:self,
            action:#selector(ViewController.swipe))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
        
        
        let swipeRight = UISwipeGestureRecognizer(
            target:self,
            action:#selector(ViewController.swipe))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        
        anotherUIView = UIView(frame: CGRect(
            x: fullSize.width * 0.5, y: fullSize.height * 0.5,
            width: 100, height: 100))
        anotherUIView.backgroundColor = UIColor.orange
        self.view.addSubview(anotherUIView)
        
        
        let pan = UIPanGestureRecognizer(
            target:self,
            action:#selector(ViewController.pan))
        pan.minimumNumberOfTouches = 1
        pan.maximumNumberOfTouches = 1
        anotherUIView.addGestureRecognizer(pan)
    }
    
    // 觸發單指輕點兩下手勢後 執行的動作
    @objc func singleTap(recognizer:UITapGestureRecognizer){
        print("單指連點兩下時觸發")
        
        // 取得每指的位置
        self.findFingersPositon(recognizer: recognizer)
    }
    
    // 觸發雙指輕點一下手勢後 執行的動作
    @objc func doubleTap(recognizer:UITapGestureRecognizer){
        print("雙指點一下時觸發")
        
        // 取得每指的位置
        self.findFingersPositon(recognizer: recognizer)
    }
    
    func findFingersPositon(recognizer:UITapGestureRecognizer) {
        // 取得每指的位置
        let number = recognizer.numberOfTouches
        for i in 0..<number {
            let point = recognizer.location(
                ofTouch: i, in: recognizer.view)
            print(
                "第 \(i + 1) 指的位置：\(NSCoder.string(for: point))")
        }
    }
    
    // 觸發長按手勢後 執行的動作
    @objc func longPress(recognizer:UILongPressGestureRecognizer) {
        if recognizer.state == .began {
            print("長按開始")
        } else if recognizer.state == .ended {
            print("長按結束")
        }
        
    }
    
    // 觸發滑動手勢後 執行的動作
    @objc func swipe(recognizer:UISwipeGestureRecognizer) {
        let point = myUIView.center
        
        if recognizer.direction == .up {
            print("Go Up")
            if point.y >= 150 {
                myUIView.center = CGPoint(
                    x: myUIView.center.x,
                    y: myUIView.center.y - 100)
            } else {
                myUIView.center = CGPoint(
                    x: myUIView.center.x, y: 50)
            }
        } else if recognizer.direction == .left {
            print("Go Left")
            if point.x >= 150 {
                myUIView.center = CGPoint(
                    x: myUIView.center.x - 100,
                    y: myUIView.center.y)
            } else {
                myUIView.center = CGPoint(
                    x: 50, y: myUIView.center.y)
            }
        } else if recognizer.direction == .down {
            print("Go Down")
            if point.y <= fullSize.height - 150 {
                myUIView.center = CGPoint(
                    x: myUIView.center.x,
                    y: myUIView.center.y + 100)
            } else {
                myUIView.center = CGPoint(
                    x: myUIView.center.x,
                    y: fullSize.height - 50)
            }
        } else if recognizer.direction == .right {
            print("Go Right")
            if point.x <= fullSize.width - 150 {
                myUIView.center = CGPoint(
                    x: myUIView.center.x + 100,
                    y: myUIView.center.y)
            } else {
                myUIView.center = CGPoint(
                    x: fullSize.width - 50,
                    y: myUIView.center.y)
            }
        }
    }
    // 觸發拖曳手勢後 執行的動作
    @objc func pan(recognizer:UIPanGestureRecognizer) {
        // 設置 UIView 新的位置
        let point = recognizer.location(in: self.view)
        anotherUIView.center = point
    }

}

