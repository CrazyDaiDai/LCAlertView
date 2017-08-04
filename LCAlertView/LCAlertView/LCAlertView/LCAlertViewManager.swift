//
//  LCAlertViewManager.swift
//  LCAlertView
//
//  Created by 呆仔～林枫 on 2017/8/4.
//  Copyright © 2017年 Lin_Crazy. All rights reserved.
//

import UIKit

class LCAlertViewManager: NSObject {
    
    static let shareInstance = LCAlertViewManager()
    var alertView : LCAlertView?
    
    private override init() {
        
        super.init()
        alertView = LCAlertView.init(frame: .init(x: 0, y: 0, width: SCREEN_WIDTH, height: 64))
        alertView?.isUserInteractionEnabled = true
    }

    func showAlertOfType(type : AlertViewType,title : String) {
        
        if title != "" {
            UIApplication.shared.keyWindow?.addSubview(self.alertView!)
            alertView?.topAlertViewType(type: type, title: title)
            alertView?.show()
            let tap = UIGestureRecognizer.init(target: self, action: #selector(tapAlertView))
            tap.cancelsTouchesInView = false
            alertView?.addGestureRecognizer(tap)
        } else {
            tapAlertView()
        }
    }
    
    func tapAlertView() {
        
        alertView?.dismiss()
    }
}



