//
//  String+ChXAdd.swift
//  ChXPopViewDemo
//
//  Created by Xu Chen on 2018/10/25.
//  Copyright © 2018 xu.yzl. All rights reserved.
//  字符串的一些常用扩展

import UIKit

extension String {
    
    /// 普通文本转换成富文本
    ///
    /// - Returns: 富文本
    func chx_convertToMutableString(
        _ textColor: UIColor = UIColor(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 1),
                                    _ fontSize: CGFloat = 12.0,
                                    _ lineSpace: CGFloat = 8.0) -> NSAttributedString {
        print(self)
        
        let text = self
        let attributeText = NSMutableAttributedString.init(string: text)
        let textRange = NSRange(location: 0, length: text.count)
        
        // 设置段落属性
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace; // 设置行间距
//        paragraphStyle.firstLineHeadIndent = 40 // 首行缩进距离
//        paragraphStyle.headIndent = 50 // 文本每一行的缩进距离
//        paragraphStyle.tailIndent = 20 // 文末缩进距离
//        paragraphStyle.alignment = .justified // 文本对齐方式
        attributeText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: textRange)
        
        // 设置字体
        attributeText.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: fontSize), range: textRange)
        // 设置文本背景色
//        attributeText.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.yellow, range: textRange)
        // 设置文本前景色
        attributeText.addAttribute(NSAttributedString.Key.foregroundColor, value: textColor, range: textRange)
        
        // 设置字距
//        attributeText.addAttribute(NSAttributedString.Key.kern, value: 1, range: textRange)
        
        return attributeText
    }
    
}
