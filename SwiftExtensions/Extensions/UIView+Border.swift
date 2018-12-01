//
//  UIView+Border.swift
//  SwiftExtensions
//
//  Created by uhooi on 2018/12/01.
//  Copyright © 2018 THE Uhooi. All rights reserved.
//

import UIKit

/// UIView拡張(枠線)
public extension UIView {
    
    // MARK: Properties
    
    /// 枠線の色
    @IBInspectable public var borderColor: UIColor? {
        get {
            return self.layer.borderColor.map { UIColor(cgColor: $0) }
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    /// 枠線の幅
    @IBInspectable public var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    /// 角の半径
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.clipsToBounds = newValue > 0
        }
    }
    
}
