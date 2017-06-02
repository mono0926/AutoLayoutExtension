//
//  NSLayoutConstraint.extension.swift
//  JoinUs
//
//  Created by mono on 2017/06/02.
//  Copyright © 2017 Vikona Inc. All rights reserved.
//

import Foundation

extension NSLayoutConstraint: AutoLayoutExtensionCompatible {}

extension AutoLayoutExtension where Base: NSLayoutConstraint {
    public func activate() {
        base.isActive = true
    }
    public func deactivate() {
        base.isActive = false
    }
}
