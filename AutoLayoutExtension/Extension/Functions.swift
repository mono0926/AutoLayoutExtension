//
//  Functions.swift
//  AutoLayoutExtension
//
//  Created by mono on 2017/09/14.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation

public func additionalCGFloatForUnderIOS11(_ value: CGFloat) -> CGFloat {
    if #available(iOS 11.0, *) {
        return 0
    } else {
        return value
    }
}
