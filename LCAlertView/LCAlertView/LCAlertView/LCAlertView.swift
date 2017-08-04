//
//  LCAlertView.swift
//  LCAlertView
//
//  Created by 呆仔～林枫 on 2017/8/4.
//  Copyright © 2017年 Lin_Crazy. All rights reserved.
//

import UIKit

enum AlertViewType {
    case AlertViewSuccess
    case AlertViewError
    case AlertViewMessage
    case AlertViewDismiss
}

let image_W = 30.0
let image_CenterX = 25.0
let image_CenterY = 40.0
let font_Size : CGFloat = 16
let left_Offset : CGFloat = 45.0
let H : CGFloat = 64.0

class LCAlertView: UIView {

    var alertViewType : AlertViewType?

    override init(frame: CGRect) {
        super.init(frame: frame)
        let viewTap = UITapGestureRecognizer.init(target: self, action: #selector(viewTapClick))
        viewTap.cancelsTouchesInView = false
        self.addGestureRecognizer(viewTap)
    }
    // self的点击方法
    func viewTapClick() {
        
        dismiss()
    }

    func topAlertViewType(type : AlertViewType,title : String) {
        
        switch type {
        case AlertViewType.AlertViewSuccess:
            setAlertViewUI(backgroundColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), imageName: "success.png", title: title, textColor: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
            break
        case AlertViewType.AlertViewError:
            setAlertViewUI(backgroundColor: #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1), imageName: "error.png", title: title, textColor: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
            break
        case AlertViewType.AlertViewMessage:
            setAlertViewUI(backgroundColor: #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1), imageName: "alert.png", title: title, textColor: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))
            break
        default:
            dismiss()
            break
        }
    }
    
    func setAlertViewUI(backgroundColor : UIColor,imageName : String,title : String,textColor : UIColor) {
        self.frame = CGRect.init(x: 0, y: -H, width: SCREEN_WIDTH, height: H)
        self.backgroundColor = backgroundColor
        self.imageView.image = UIImage.init(named: imageName)
        self.titleLabel.text = title
        self.titleLabel.textColor = textColor
    }
    
    //MARK: -显示
    func show() {
        
        UIView.animate(withDuration: 0.6,
                       delay: 0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 10.0,
                       options: .curveEaseInOut,
                       animations: {
                        self.center = CGPoint.init(x: self.center.x, y: 32)
                        UIApplication.shared.keyWindow?.bringSubview(toFront: self)
        }, completion: nil)
    }
    //MARK: -移除
    func dismiss() {
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.99, initialSpringVelocity: 15, options: .curveEaseInOut, animations: { 
            self.center = CGPoint.init(x: self.center.x, y: -32)
        }) { (Bool) in
            self.removeFromSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -Lazy
    // 左侧的图片
    lazy var imageView : UIImageView = {
    
        let imageView = UIImageView.init()
        imageView.frame = CGRect.init(x: 0, y: 0, width: image_W, height: image_W)
        imageView.center = CGPoint.init(x: image_CenterX, y: image_CenterY)
        self.addSubview(imageView)
        return imageView
    }()
    //右侧的文字
    lazy var titleLabel : UILabel = {
    
        let titleLabel = UILabel()
        titleLabel.frame = CGRect.init(x: left_Offset, y: 20, width: SCREEN_WIDTH - left_Offset, height: 40)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: font_Size)
        self.addSubview(titleLabel)
        return titleLabel
    }()
}
