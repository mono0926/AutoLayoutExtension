//
//  UIViewLayoutGuideProxy.swift
//  AutoLayoutExtension
//
//  Created by mono on 2017/11/01.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation

final class UIViewLayoutGuideProxy: UILayoutGuide {

    private weak var _base: UIView?

    init(_ view: UIView) {
        self._base = view
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("UIViewLayoutGuideProxy cannot be instantiated from NSCoder. Use init(UIView) instead.")
    }

    override var leftAnchor: NSLayoutXAxisAnchor {
        return _base?.leftAnchor ?? NSLayoutXAxisAnchor()
    }

    override var topAnchor: NSLayoutYAxisAnchor {
        return _base?.topAnchor ?? NSLayoutYAxisAnchor()
    }

    override var bottomAnchor: NSLayoutYAxisAnchor {
        return _base?.bottomAnchor ?? NSLayoutYAxisAnchor()
    }

    override var rightAnchor: NSLayoutXAxisAnchor {
        return _base?.rightAnchor ?? NSLayoutXAxisAnchor()
    }

    override var widthAnchor: NSLayoutDimension {
        return _base?.widthAnchor ?? NSLayoutDimension()
    }

    override var heightAnchor: NSLayoutDimension {
        return _base?.heightAnchor ?? NSLayoutDimension()
    }

    override var leadingAnchor: NSLayoutXAxisAnchor {
        return _base?.leadingAnchor ?? NSLayoutXAxisAnchor()
    }

    override var trailingAnchor: NSLayoutXAxisAnchor {
        return _base?.trailingAnchor ?? NSLayoutXAxisAnchor()
    }

    override var centerXAnchor: NSLayoutXAxisAnchor {
        return _base?.centerXAnchor ?? NSLayoutXAxisAnchor()
    }

    override var centerYAnchor: NSLayoutYAxisAnchor {
        return _base?.centerYAnchor ?? NSLayoutYAxisAnchor()
    }
}
