//
//  AppDelegate.swift
//  UITabBarController
//
//  Created by 周晓磊 on 2019/3/9.
//  Copyright © 2019 LeoZhou. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // create a UIWindow
        self.window = UIWindow(frame:UIScreen.main.bounds)
        self.window!.backgroundColor = UIColor.white
        
        // create UITabBarController
        let myTabBar = UITabBarController()
        
        // 設置標籤列
        // 使用 UITabBarController 的屬性 tabBar 的各個屬性設置
        myTabBar.tabBar.backgroundColor = UIColor.clear
        
        // create main view
        let mainViewController = ViewController()
        mainViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 100)
        
        // 建立頁面 使用自定義圖示 有預設圖片及按下時圖片
        let articleViewController = ArticleViewController()
        articleViewController.tabBarItem = UITabBarItem(
            title: "文章",
            image: UIImage(named: "ButtonAirplane"),
            selectedImage: UIImage(named: "ButtonWork"))
        
        // 建立頁面 使用自定義圖示 只有預設圖片
        let introViewController = IntroViewController()
        introViewController.tabBarItem = UITabBarItem(
            title: "介紹",
            image: UIImage(named: "ButtonMotorcycle"),
            tag: 200)
        
        // 建立頁面 使用自定義圖示 可使用 tabBarItem 的屬性各自設定
        let settingViewController = SettingViewController()
        settingViewController.tabBarItem.image = UIImage(named: "ButtonPet")
        settingViewController.tabBarItem.title = "設定"
        
        // 加入到 UITabBarController
        myTabBar.viewControllers = [
            mainViewController, articleViewController,
            introViewController, settingViewController]
        
        // 預設開啟的頁面 (從 0 開始算起)
        myTabBar.selectedIndex = 0
        
        // 設置根視圖控制器
        self.window!.rootViewController = myTabBar
        
        // 將 UIWindow 設置為可見的
        self.window!.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

