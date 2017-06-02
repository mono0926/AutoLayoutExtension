//
//  Array.extension.swift
//  JoinUs
//
//  Created by mono on 2017/06/02.
//  Copyright © 2017 Vikona Inc. All rights reserved.
//

import Foundation

extension Array where Element == NSLayoutConstraint? {
    public func activate() {
        forEach { $0?.ale.activate() }
    }
    public func deactivate() {
        forEach { $0?.ale.deactivate() }
    }
}
