//
//  IntroViewController.swift
//  MultiPages
//
//  Created by 周晓磊 on 2019/3/8.
//  Copyright © 2019 LeoZhou. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
        myLabel.text = "Intro"
        self.view.addSubview(myLabel)
        
        // 建立前往 Article 頁面的 UIButton
        let myButton = UIButton(frame: CGRect(
            x: 0, y: 0, width: 100, height: 30))
        myButton.setTitle("GoBack", for: .normal)
        myButton.backgroundColor = UIColor.lightGray
        myButton.addTarget(
            nil, action: #selector(IntroViewController.goBack),
            for: .touchUpInside)
        myButton.center = CGPoint(
            x: fullSize.width * 0.5, y: fullSize.height * 0.2)
        self.view.addSubview(myButton)
    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion:nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
