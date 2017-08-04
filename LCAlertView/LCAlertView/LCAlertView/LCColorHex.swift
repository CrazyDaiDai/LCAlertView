//
//  LCColorHex.swift
//  LCAlertView
//
//  Created by 呆仔～林枫 on 2017/8/4.
//  Copyright © 2017年 Lin_Crazy. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height

extension UIColor {

    //默认alpha值为1
    public class func colorWithHex(Color_Str : NSString) -> UIColor {
        
        return UIColor.colorWithHex(Color_Value: Color_Str, alpha: 1)
    }
    
    public class func colorWithHex(Color_Value : NSString, alpha : CGFloat) -> UIColor{
        
        var  Str :NSString = Color_Value.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased() as NSString
        if Str.length < 6 { return UIColor.clear }
        if Color_Value.hasPrefix("#"){Str = Color_Value.substring(from: 1) as NSString}
        if Color_Value.hasPrefix("0x") {Str = Color_Value.substring(from: 2) as NSString}
        let redStr = (Str as NSString ).substring(to: 2)
        let greenStr = ((Str as NSString).substring(from: 2) as NSString).substring(to: 2)
        let blueStr = ((Str as NSString).substring(from: 4) as NSString).substring(to: 2)
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string:redStr).scanHexInt32(&r)
        Scanner(string: greenStr).scanHexInt32(&g)
        Scanner(string: blueStr).scanHexInt32(&b)
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
    }
}
