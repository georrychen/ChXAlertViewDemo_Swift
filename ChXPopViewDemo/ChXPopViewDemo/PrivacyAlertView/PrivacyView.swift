//
//  PrivacyView.swift
//  ChXPopViewDemo
//
//  Created by Xu Chen on 2018/10/25.
//  Copyright © 2018 xu.yzl. All rights reserved.
//

import UIKit

/// 视图按钮类型枚举
///
/// - btnTypeClose: 关闭按钮
/// - btnTypeSure:  确定按钮
enum PrivacyViewBtnType {
    case BtnTypeClose
    case BtnTypeSure
}

class PrivacyView: UIView {

    /// 文本框
    @IBOutlet weak var textView: UITextView!
    
    /// 按钮点击事件闭包回调
    var buttonClickedClosure: ((_ buttonType: PrivacyViewBtnType)->())?
    
    /// 关闭按钮点击事件
    @IBAction func clickedClose(_ sender: UIButton) {
        buttonClickedClosure?(PrivacyViewBtnType.BtnTypeClose)
    }
    /// 确定按钮点击事件
    @IBAction func clickedSure(_ sender: UIButton) {
        buttonClickedClosure?(PrivacyViewBtnType.BtnTypeSure)
    }
  
    /// 类方法获取视图对象
    ///
    /// - Returns: 当前视图对象
    @objc class func privacyView() -> PrivacyView {
        let view = Bundle.main.loadNibNamed("PrivacyView", owner: nil, options: nil)?.first as! PrivacyView
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        
        view.getTextViewShowText()
        
        return view
    }
    
    /// 获取文本框中的文字
    func getTextViewShowText() {
        let text = " 1.1 保宝网的所有权和运营权归深圳市永兴元科技有限公司所有。\n 1.2 用户在注册之前，应当仔细阅读本协议，并同意遵守本协议后方可成为注册用户。一旦注册成功，则用户与保宝网之间自动形成协议关系，用户应当受本协议的约束。用户在使用特殊的服务或产品时，应当同意接受相关协议后方能使用。\n 1.3 本协议则可由保宝网随时更新，用户应当及时关注并同意本站不承担通知义务。本站的通知、公告、声明或其它类似内容是本协议的一部分。"
        self.textView.attributedText = getDefaultAttributString(text: text)
    }
    
    func getDefaultAttributString(text: String) -> NSAttributedString {
        if text.isEmpty {
            return NSAttributedString.init(string: "暂无数据")
        }
        return text.chx_convertToMutableString()
    }
    
}
