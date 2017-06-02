//
//  Array.extension.swift
//  AutoLayoutExtension
//
//  Created by mono on 2017/06/02.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation

extension Array where Element == NSLayoutConstraint {
    public func activate() {
        NSLayoutConstraint.activate(self)
    }
    public func deactivate() {
        NSLayoutConstraint.deactivate(self)
    }
}
