//
//  UIImage+Data.swift
//  SwiftExtensions
//
//  Created by uhooi on 2018/12/01.
//  Copyright © 2018 THE Uhooi. All rights reserved.
//

import UIKit

/// UIImage拡張(データ)
public extension UIImage {
    
    // MARK: Public Methods
    
    /// イメージ→PNGデータへ変換する
    ///
    /// - Returns: 変換後のPNGデータ
    public func toPNGData() -> Data {
        guard let data = self.pngData() else {
            print("イメージをPNGデータに変換できませんでした。")
            return Data()
        }
        
        return data
    }
    
    /// イメージ→JPEGデータへ変換する
    ///
    /// - Returns: 変換後のJPEGデータ
    public func toJPEGData() -> Data {
        guard let data = self.jpegData(compressionQuality: 1.0) else {
            print("イメージをJPEGデータに変換できませんでした。")
            return Data()
        }
        
        return data
    }
    
}
