//
//  ViewControllerExtensions.swift
//  UISearchController
//
//  Created by 周晓磊 on 2019/3/8.
//  Copyright © 2019 LeoZhou. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.searchController.isActive) {
            return self.searchArr.count
        } else {
            return self.cities.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
        if (self.searchController.isActive) {
            cell.textLabel?.text = self.searchArr[indexPath.row]
            return cell
        } else {
            cell.textLabel?.text = self.cities[indexPath.row]
            return cell
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        if (self.searchController.isActive) {
            print("你選擇的是 \(self.searchArr[indexPath.row])")
        } else {
            print("你選擇的是 \(self.cities[indexPath.row])")
        }
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController){
        // 取得搜尋文字
        guard let searchText = searchController.searchBar.text else {
            return
        }
        
        // 使用陣列的 filter() 方法篩選資料
        self.searchArr = self.cities.filter(
            { (city) -> Bool in
                let result = city.range(of: searchText)
                if result == nil {
                    return false
                }
                return !(result!.isEmpty)
        })
    }
}
