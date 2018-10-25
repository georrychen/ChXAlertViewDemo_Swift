//
//  ChXBaseAlertView.swift
//  ChXPopViewDemo
//
//  Created by Xu Chen on 2018/10/25.
//  Copyright © 2018 xu.yzl. All rights reserved.
//  基本弹窗基类视图，封装一些弹窗显示、消失的动画，方便项目中调用，耦合度较低

import UIKit

class ChXBaseAlertView: UIView {

    /// 阴影背景视图
    lazy var shadowBackgroundView = UIView()
    /// 点击阴影视图销毁视图功能是否可用
    var eableShadowViewTapGesture = true
    
    /// 弹窗视图
    lazy var alertView = UIView()
    
    /// 全屏尺寸弹出窗
    ///
    /// - Returns: 当前视图对象
    @objc class func getAlertView() -> ChXBaseAlertView {
        let windowFrame = (UIApplication.shared.keyWindow?.bounds)!
        return ChXBaseAlertView.init(frame: windowFrame)
    }
    
    /// 自定义尺寸弹窗
    ///
    /// - Parameter frame: 尺寸
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        addResponseAction()
        configureAlertView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 供子类配置弹窗视图
    func configureAlertView() {
    }
    
}

// MARK: - UI
extension ChXBaseAlertView {
    
    /// 创建UI
    func setupUI() {
        shadowBackgroundView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.4)
        shadowBackgroundView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        
        // 默认弹窗视图大小
        alertView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        alertView.center = self.center;
        
        self.addSubview(shadowBackgroundView)
        self.addSubview(alertView)
    }
    
    /// 响应事件
    func addResponseAction() {
        // 点击背景，视图消失
        if eableShadowViewTapGesture {
            let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(dismiss))
            shadowBackgroundView.addGestureRecognizer(tapGesture)
        }
    }
}

// MARK: - 弹出、消失动画
@objc extension ChXBaseAlertView {
    
    /// 消失
    @objc func dismiss() {
        // 1. 渐隐动画
        let duration = 0.15
        UIView.animate(withDuration: duration, delay: 0.1, options: AnimationOptions.curveLinear, animations: {
            self.shadowBackgroundView.alpha = 0
            self.alertView.alpha = 0
        }, completion: nil)
        
        // 2. 缩放动画
        UIView.animate(withDuration: duration, delay: 0.1, options: AnimationOptions.curveLinear, animations: {
            self.alertView.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        }) { (_) in
            self.removeFromSuperview()
        }
    }
    
    /// 显示
    ///
    /// - Parameter parentView: 父视图
    func popToView(parentView: UIView) {
        parentView.addSubview(self)
        
        // 1. 渐显动画
        let duration = 0.3
        shadowBackgroundView.alpha = 0
        alertView.alpha = 0
        UIView.animate(withDuration: duration, delay: 0.1, options: AnimationOptions.curveLinear, animations: {
            self.shadowBackgroundView.alpha = 0.4
            self.alertView.alpha = 1
        }, completion: nil)
        
        // 2. 缩放动画
        let keyPathAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        keyPathAnimation.values = [NSNumber(value: 0.8), NSNumber(value: 1.05), NSNumber(value: 1.1), NSNumber(value: 1.0)]
        keyPathAnimation.keyTimes = [NSNumber(value: 0), NSNumber(value: 0.3), NSNumber(value: 0.5),NSNumber(value: 1.0)]
        keyPathAnimation.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear), CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear), CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear), CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)]
       keyPathAnimation.duration = duration
    
       layer.add(keyPathAnimation, forKey: "bouce")
    }
}

