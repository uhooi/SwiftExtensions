//
//  String+Date.swift
//  SwiftExtensions
//
//  Created by uhooi on 2018/12/14.
//  Copyright © 2018 THE Uhooi. All rights reserved.
//

import Foundation

/// String拡張(日付)
public extension String {
    
    // MARK: Public Methods
    
    /// 文字列→日付に変換する
    ///
    /// - Parameter format: フォーマット
    /// - Returns: 変換後の日付
    public func toDate(format: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: format, options: 0,
                                                        locale: Locale(identifier: "ja_JP"))
        guard let date = formatter.date(from: self) else {
            return Date()
        }
        
        return date
    }
    
}
