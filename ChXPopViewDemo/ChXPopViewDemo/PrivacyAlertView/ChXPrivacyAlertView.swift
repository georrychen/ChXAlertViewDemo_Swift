//
//  ChXPrivacyAlertView.swift
//  ChXPopViewDemo
//
//  Created by Xu Chen on 2018/10/25.
//  Copyright © 2018 xu.yzl. All rights reserved.
//

import UIKit

/// 1. 声明协议
@objc protocol PrivacyViewDelegate: NSObjectProtocol {
    /// 协议方法 - 按钮点击
    func privacyViewButtonDidClicked()
}

class ChXPrivacyAlertView: ChXBaseAlertView {
    
    // 2. 声明代理属性，响应协议方法
   @objc var delegate: PrivacyViewDelegate?
    
    /// 配置弹窗视图
    override func configureAlertView() {
        let privacyView = PrivacyView.privacyView()
        privacyView.buttonClickedClosure = { (buttonType: PrivacyViewBtnType) -> Void in
            switch buttonType {
                case PrivacyViewBtnType.BtnTypeSure:
                    print("点击了 确定")
                    self.dismiss()
                case PrivacyViewBtnType.BtnTypeClose:
                    print("点击了 关闭")
                    self.dismiss()
            }
            
            // 3. 传值
            self.delegate?.privacyViewButtonDidClicked()
        }
        print(privacyView.frame)
        
        self.alertView.bounds = privacyView.bounds
        self.alertView.addSubview(privacyView)
    }
    
    /// 获取视图对象
    @objc class func getPrivacyView() -> ChXPrivacyAlertView {
        let windowFrame = (UIApplication.shared.keyWindow?.bounds)!
        return ChXPrivacyAlertView.init(frame: windowFrame)
    }
    
}
