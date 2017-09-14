//
//  Functions.swift
//  AutoLayoutExtension
//
//  Created by mono on 2017/09/14.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation

public let standardSpacing: CGFloat = 8

public func additionalCGFloatForUnderIOS11(_ value: CGFloat) -> CGFloat {
    if #available(iOS 11.0, *) {
        return 0
    } else {
        return value
    }
}

public func standardSpacingForUnderIOS11() -> CGFloat {
    return additionalCGFloatForUnderIOS11(standardSpacing)
}
