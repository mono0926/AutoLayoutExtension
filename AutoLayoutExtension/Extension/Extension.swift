//
//  Extension.swift
//  JoinUs
//
//  Created by mono on 2017/06/02.
//  Copyright © 2017 Vikona Inc. All rights reserved.
//

import Foundation

public struct AutoLayoutExtension<Base> {
    let base: Base
    init (_ base: Base) {
        self.base = base
    }
}

public protocol AutoLayoutExtensionCompatible {
    associatedtype Compatible
    static var ale: AutoLayoutExtension<Compatible>.Type { get }
    var ale: AutoLayoutExtension<Compatible> { get }
}

extension AutoLayoutExtensionCompatible {
    public static var ale: AutoLayoutExtension<Self>.Type {
        return AutoLayoutExtension<Self>.self
    }

    public var ale: AutoLayoutExtension<Self> {
        return AutoLayoutExtension(self)
    }
}
