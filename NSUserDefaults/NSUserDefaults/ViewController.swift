//
//  ViewController.swift
//  NSUserDefaults
//
//  Created by Leo Zhou on 2019/3/9.
//  Copyright © 2019 LeoZhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    var infoTextView : UITextView!
    var myUserDefaults :UserDefaults!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Home"
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Show",
            style: .plain,
            target: self,
            action: #selector(ViewController.showInfo))
        
        
        let fullScreenSize = UIScreen.main.bounds.size
        
        infoTextView = UITextView(frame: CGRect(x: 0.1 * fullScreenSize.width, y: 20, width: 0.8 * fullScreenSize.width, height: 200))
        infoTextView.textColor = UIColor.black
        infoTextView.backgroundColor = UIColor.lightGray
        infoTextView.keyboardType = .default
        infoTextView.returnKeyType = .default
        infoTextView.isEditable = true
        infoTextView.isSelectable = true
        infoTextView.delegate = self
        self.view.addSubview(infoTextView)
        
        let buttonw: CGFloat = 100
        let buttonh: CGFloat = 30
        let space = (fullScreenSize.width - 2 * buttonw) / 3
        let buttony = 20 + infoTextView.bounds.size.height + 20
        
        let updateButton = UIButton(frame: CGRect(x: space, y: buttony, width: buttonw, height: buttonh))
        updateButton.setTitle("Update", for: .normal)
        updateButton.backgroundColor = UIColor.black
        updateButton.addTarget(self, action: #selector(ViewController.updateInfo), for: .touchUpInside)
        self.view.addSubview(updateButton)
        
        let deleteButton = UIButton(frame: CGRect(x: 2 * space + buttonw, y: buttony, width: buttonw, height: buttonh))
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.backgroundColor = UIColor.black
        deleteButton.addTarget(self, action: #selector(ViewController.deleteInfo), for: .touchUpInside)
        self.view.addSubview(deleteButton)
        
        myUserDefaults = UserDefaults.standard
        self.showInfo()
    }
    
    @objc func showInfo() {
        if let info = myUserDefaults.object(forKey: "info") as? String {
            infoTextView.text = info
        } else {
            infoTextView.text = "No information saved."
            infoTextView.textColor = UIColor.red
        }
    }
    
    @objc func updateInfo() {
        print("update info")
        self.view.endEditing(true)
        myUserDefaults.set(infoTextView.text, forKey: "info")
        myUserDefaults.synchronize()
    }
    
    @objc func deleteInfo() {
        print("delete info")
        myUserDefaults.removeObject(forKey: "info")
        infoTextView.text = ""
    }
}

