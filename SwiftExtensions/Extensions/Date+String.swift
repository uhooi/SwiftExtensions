//
//  Date+String.swift
//  SwiftExtensions
//
//  Created by uhooi on 2018/12/01.
//  Copyright © 2018 THE Uhooi. All rights reserved.
//

import Foundation

/// Date拡張(文字列)
public extension Date {
    
    // MARK: Public Methods
    
    /// 日付→文字列に変換する
    ///
    /// - Parameter format: フォーマット
    /// - Returns: 変換後の文字列
    public func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: format, options: 0,
                                                        locale: Locale(identifier: "ja_JP"))
        return formatter.string(from: self)
    }
    
}
