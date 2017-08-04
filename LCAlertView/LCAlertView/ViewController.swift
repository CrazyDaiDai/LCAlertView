//
//  ViewController.swift
//  LCAlertView
//
//  Created by 呆仔～林枫 on 2017/8/4.
//  Copyright © 2017年 Lin_Crazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var dataArray : Array<String>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "LCAlertView"
        dataArray = ["成功","失败","提示","立即消失,和点击alert效果一样"]
        view.addSubview(tableView)
    }

    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell.init(style: .value1, reuseIdentifier: nil)
        cell.textLabel?.text = dataArray?[indexPath.row]
        cell.selectionStyle = .none
        cell.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertManager = LCAlertViewManager.shareInstance
//        if indexPath.row < 3 {
            let  titleArray = ["成功了哦!","很可惜啊!","我是一个提示"]
            let typeArray = [AlertViewType.AlertViewSuccess,AlertViewType.AlertViewError,AlertViewType.AlertViewMessage,AlertViewType.AlertViewDismiss]
        let titleStr = titleArray.count > indexPath.row ? titleArray[indexPath.row] : ""
        alertManager.showAlertOfType(type: typeArray[indexPath.row], title: titleStr)
//        } else {
//            alertManager.tapAlertView()
//        }
    }
    
    lazy var tableView : UITableView = {
        
        let tableView = UITableView.init(frame: .init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: .plain)
        tableView.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

