//
//  ViewController.swift
//  Animations
//
//  Created by Leo Zhou on 2019/3/9.
//  Copyright © 2019 LeoZhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var fullSize: CGSize!
    var myLabel: UILabel!
    
    enum TestButton: Int, CaseIterable {
        case bounds, alpha, backgroundColor, center, transform, all
        func getButtonLabel()->String {
            switch self {
            case .bounds:
                return "bounds"
            case .alpha:
                return "alpha"
            case .backgroundColor:
                return "backgroundColor"
            case .center:
                return "center"
            case .transform:
                return "transform"
            case .all:
                return "all"
            }
        }
    }
    
    let arrBounds = [
        CGSize(width: 100, height: 100), CGSize(width: 50, height: 50),
        CGSize(width: 150, height: 150), CGSize(width: 50, height: 50)]
    var arrCenter :[CGPoint]!
    let arrAlpha = [0.25, 0.75, 0.5, 1.0]
    let arrBackgroundColor = [
        UIColor.cyan, UIColor.green,
        UIColor.orange, UIColor.black]
    let arrTransform =
        [CGAffineTransform(rotationAngle: CGFloat(Double.pi * 0.25)),
         CGAffineTransform(rotationAngle: CGFloat(Double.pi * 1.25)),
         CGAffineTransform(rotationAngle: CGFloat(Double.pi * 1.75)),
         CGAffineTransform(rotationAngle: CGFloat(Double.pi * 2))]
    
    var indexBounds = 0
    var indexCenter = 0
    var indexAlpha = 0
    var indexBackgroundColor = 0
    var indexTransform = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 取得螢幕的尺寸
        fullSize = UIScreen.main.bounds.size
        arrCenter = [
            CGPoint(x: fullSize.width * 0.75,
                    y: fullSize.width * 0.25),
            CGPoint(x: fullSize.width * 0.75,
                    y: fullSize.width * 0.75),
            CGPoint(x: fullSize.width * 0.25,
                    y: fullSize.width * 0.75),
            CGPoint(x: fullSize.width * 0.25,
                    y: fullSize.width * 0.25)]
        
        // 建立一個 UILabel
        myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        myLabel.text = "Swift"
        myLabel.backgroundColor = UIColor.black
        myLabel.textColor = UIColor.white
        myLabel.textAlignment = .center
        myLabel.center = CGPoint(x: fullSize.width * 0.25, y: fullSize.width * 0.25)
        self.view.addSubview(myLabel)
        
        // 建立 UIButton
        self.createButtons()
    }
    
    func createButtons() {
        var button : UIButton
        var index: UInt = 0;
        let width : CGFloat = 150
        let height :CGFloat = 30
        let hspace : CGFloat  = 20
        let rowNumber : UInt = 2
        let vspace = (fullSize.width - CGFloat(rowNumber) * width) / CGFloat(rowNumber + 1)
        
        for buttonType in TestButton.allCases {
            button = createButton(buttonType.getButtonLabel(), buttonType.rawValue, width, height)
            button.center = CGPoint(
                x: vspace + width / 2 + (width + vspace) * CGFloat(index % rowNumber),
                y: fullSize.height - hspace - height / 2 - CGFloat(index / rowNumber) * (hspace + height))
            self.view.addSubview(button)
            index += 1
        }
    }
    
    func createButton(_ label:String, _ tag:Int, _ width:CGFloat, _ height:CGFloat) -> UIButton {
        let button:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: width, height: height))
        button.setTitle(label, for: .normal)
        button.tag = tag
        button.setTitleColor(UIColor.white, for: .normal)
        button.isEnabled = true
        button.backgroundColor = UIColor.darkGray
        button.addTarget(self, action: #selector(ViewController.clickButton), for: .touchUpInside)
        return button
    }
    
    @objc func clickButton(sender: UIButton) {
        switch sender.tag {
        case TestButton.bounds.rawValue:
            AnimateBounds()
        case TestButton.alpha.rawValue:
            AnimateAlpha()
        case TestButton.backgroundColor.rawValue:
            AnimateBackgroundColor()
        case TestButton.center.rawValue:
            AnimateCenter()
        case TestButton.transform.rawValue:
            AnimateTransform()
        case TestButton.all.rawValue:
            AnimateAll()
        default:
            fatalError("button action not supported: \(sender.tag)")
        }
    }
    
    func AnimateBounds() {
        let newSize = self.arrBounds[self.indexBounds]
        let originCenter = self.myLabel.center
        UIView.animate(
            withDuration: 0.5,
            animations: {
                self.myLabel.bounds = CGRect(
                    x: 0, y: 0,
                    width: newSize.width, height: newSize.height)
                self.myLabel.center = originCenter
        })
        self.updateIndex("bounds")
    }
    func AnimateAlpha() {
        UIView.animate(withDuration: 0.5, animations: {
            self.myLabel.alpha = CGFloat(self.arrAlpha[self.indexAlpha])
        }, completion: { _ in
            print("Animation Alpha Complete")
        })
        
        self.updateIndex("alpha")
    }
    
    func AnimateBackgroundColor() {
        UIView.animate(withDuration: 1, delay: 0.2, options: .curveEaseIn, animations: {
            self.myLabel.backgroundColor = self.arrBackgroundColor[self.indexBackgroundColor]
        }, completion: { _ in
            print("Animation BackgroundColor Complete")
        })
        self.updateIndex("backgroundColor")
    }
    
    func AnimateCenter() {
        UIView.animate(withDuration: 1.5, delay: 0.1, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.myLabel.center = self.arrCenter[self.indexCenter]
        }, completion: { _ in
            print("Animation Center Complete")
        })
        self.updateIndex("center")
    }
    
    func AnimateTransform() {
        UIView.animate(withDuration: 0.5, animations: {
            self.myLabel.transform = self.arrTransform[self.indexTransform]
        })
        self.updateIndex("transform")
    }
    
    func AnimateAll() {
        let newSize = self.arrBounds[self.indexBounds]
        UIView.animate(withDuration: 0.5, animations: {
            self.myLabel.bounds = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
            self.myLabel.alpha = CGFloat(self.arrAlpha[self.indexAlpha])
            self.myLabel.backgroundColor = self.arrBackgroundColor[self.indexBackgroundColor]
            self.myLabel.center = self.arrCenter[self.indexCenter]
            self.myLabel.transform = self.arrTransform[self.indexTransform]
        })
        self.updateIndex("all")
    }
    
    func updateIndex(_ type: String) {
        if type == "bounds" {
            self.indexBounds = self.indexBounds >= 3 ? 0 : self.indexBounds + 1
        } else if type == "alpha" {
            self.indexAlpha = self.indexAlpha >= 3 ? 0 : self.indexAlpha + 1
        } else if type == "backgroundColor" {
            self.indexBackgroundColor = self.indexBackgroundColor >= 3 ? 0 : self.indexBackgroundColor + 1
        } else if type == "center" {
            self.indexCenter = self.indexCenter >= 3 ? 0 : self.indexCenter + 1
        } else if type == "transform" {
            self.indexTransform = self.indexTransform >= 3 ? 0 : self.indexTransform + 1
        } else if type == "all" {
            self.indexBounds = self.indexBounds >= 3 ? 0 : self.indexBounds + 1
            self.indexCenter = self.indexCenter >= 3 ? 0 : self.indexCenter + 1
            self.indexAlpha = self.indexAlpha >= 3 ? 0 : self.indexAlpha + 1
            self.indexBackgroundColor = self.indexBackgroundColor >= 3 ? 0 : self.indexBackgroundColor + 1
            self.indexTransform = self.indexTransform >= 3 ? 0 : self.indexTransform + 1
        }
    }
}

