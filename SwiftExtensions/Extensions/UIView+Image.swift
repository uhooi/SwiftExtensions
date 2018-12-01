//
//  UIView+Image.swift
//  SwiftExtensions
//
//  Created by uhooi on 2018/12/01.
//  Copyright © 2018 THE Uhooi. All rights reserved.
//

import UIKit

/// UIView拡張(イメージ)
public extension UIView {
    
    // MARK: Public Methods
    
    /// ビュー→イメージに変換する
    ///
    /// サブビューもイメージ化される
    ///
    /// - Returns: 対象ビューのイメージ
    public func toImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0.0)
        guard let context = UIGraphicsGetCurrentContext() else {
            print("現在のコンテキストを取得できませんでした。")
            return UIImage()
        }
        
        self.layer.render(in: context)
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            print("ビューをイメージに変換できませんでした。")
            return UIImage()
        }
        
        UIGraphicsEndImageContext()
        
        return image
    }
    
}
