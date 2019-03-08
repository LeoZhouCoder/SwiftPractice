//
//  ViewController.swift
//  UISearchController
//
//  Created by 周晓磊 on 2019/3/8.
//  Copyright © 2019 LeoZhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView!
    var searchController: UISearchController!
    
    let cities = [
        "abc","sdfs","sdfdsf","bdfre","utu",
        "vcew","sfdf","ouio","234fds","e2fw",
        "k7k80","snpqwre5","hrtr","rty","bfthj",
        "0ykvj","734gegg","zxce","yuuyi","asdwqr",]
    
    var searchArr: [String] = [String](){
        didSet {
            // 重設 searchArr 後重整 tableView
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 取得螢幕的尺寸
        let fullScreenSize = UIScreen.main.bounds.size
        
        // 建立 UITableView
        self.tableView = UITableView(frame: CGRect(
            x: 0, y: 20,
            width: fullScreenSize.width,
            height: fullScreenSize.height - 20),
                                     style: .plain)
        self.tableView.register(UITableViewCell.self,
                                     forCellReuseIdentifier: "Cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        
        
        // 建立 UISearchController 並設置搜尋控制器為 nil
        self.searchController = UISearchController(searchResultsController: nil)
        
        // 將更新搜尋結果的對象設為 self
        self.searchController.searchResultsUpdater = self
        
        // 搜尋時是否隱藏 NavigationBar
        // 這個範例沒有使用 NavigationBar 所以設置什麼沒有影響
        self.searchController
            .hidesNavigationBarDuringPresentation = false
        
        // 搜尋時是否使用燈箱效果 (會將畫面變暗以集中搜尋焦點)
        self.searchController.dimsBackgroundDuringPresentation = false
        
        // 搜尋框的樣式
        self.searchController.searchBar.searchBarStyle = .prominent
        
        // 設置搜尋框的尺寸為自適應
        // 因為會擺在 tableView 的 header
        // 所以尺寸會與 tableView 的 header 一樣
        self.searchController.searchBar.sizeToFit()
        
        // 將搜尋框擺在 tableView 的 header
        self.tableView.tableHeaderView = self.searchController.searchBar
    }


}

