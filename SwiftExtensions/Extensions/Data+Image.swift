//
//  Data+Image.swift
//  SwiftExtensions
//
//  Created by uhooi on 2018/12/01.
//  Copyright © 2018 THE Uhooi. All rights reserved.
//

import UIKit

/// Data拡張(イメージ)
public extension Data {
    
    // MARK: Public Methods
    
    /// データ→イメージに変換する
    ///
    /// - Returns: 変換後のイメージ
    public func toImage() -> UIImage {
        guard let image = UIImage(data: self) else {
            print("データをイメージに変換できませんでした。")
            return UIImage()
        }
        
        return image
    }
    
}
