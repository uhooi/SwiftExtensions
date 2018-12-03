//
//  String+Transform.swift
//  SwiftExtensions
//
//  Created by uhooi on 2018/12/01.
//  Copyright © 2018 THE Uhooi. All rights reserved.
//

import Foundation

/// String拡張(変換)
public extension String {
    
    // MARK: Public Methods
    
    /// ひらがな→カタカナに変換する
    ///
    /// - Returns: 変換後の文字列(変換に失敗した場合は空を返す)
    public func hiraganaToKatakana() -> String {
        return transform(transform: .hiraganaToKatakana, reverse: false)
    }
    
    /// カタカナ→ひらがなに変換する
    ///
    /// - Returns: 変換後の文字列(変換に失敗した場合は空を返す)
    public func katakanaToHiragana() -> String {
        return transform(transform: .hiraganaToKatakana, reverse: true)
    }
    
    /// 全角→半角に変換する
    ///
    /// - Returns: 変換後の文字列(変換に失敗した場合は空を返す)
    public func fullwidthToHalfwidth() -> String {
        return transform(transform: .fullwidthToHalfwidth, reverse: false)
    }
    
    /// 半角→全角に変換する
    ///
    /// - Returns: 変換後の文字列(変換に失敗した場合は空を返す)
    public func halfwidthToFullwidth() -> String {
        return transform(transform: .fullwidthToHalfwidth, reverse: true)
    }
    
    // MARK: Private Methods
    
    private func transform(transform: StringTransform, reverse: Bool) -> String {
        guard let string = self.applyingTransform(transform, reverse: reverse) else {
            print("文字列を変換できませんでした。")
            return ""
        }

        return string
    }
    
}
