//
//  UIView.extension.swift
//  JoinUs
//
//  Created by mono on 2017/06/02.
//  Copyright © 2017 Vikona Inc. All rights reserved.
//

import Foundation

extension UIView: AutoLayoutExtensionCompatible { }

public typealias FilledResult = (
    top: NSLayoutConstraint,
    left: NSLayoutConstraint,
    bottom: NSLayoutConstraint,
    right: NSLayoutConstraint)

public typealias CenteredResult = (
    centerX: NSLayoutConstraint,
    centerY: NSLayoutConstraint,
    width: NSLayoutConstraint?,
    height: NSLayoutConstraint?)

extension AutoLayoutExtension where Base: UIView {

    @discardableResult
    public func addFilledSubview(_ view: UIView, insets: UIEdgeInsets = .zero) -> FilledResult {

        addAutoLayoutedSubview(view)

        let top = view.topAnchor.constraint(equalTo: base.topAnchor, constant: insets.top)
        let left = view.leftAnchor.constraint(equalTo: base.leftAnchor, constant: insets.left)
        let bottom = view.bottomAnchor.constraint(equalTo: base.bottomAnchor, constant: -insets.bottom)
        let right = view.rightAnchor.constraint(equalTo: base.rightAnchor, constant: -insets.right)

        NSLayoutConstraint.activate([top, left, bottom, right])

        return (top: top, left: left, bottom: bottom, right: right)
    }

    @discardableResult
    public func addCenteredSubview(_ view: UIView, offset point: CGPoint = .zero, size: CGSize? = nil) -> CenteredResult {

        addAutoLayoutedSubview(view)
        let centerX = view.centerXAnchor.constraint(equalTo: base.centerXAnchor, constant: point.x)
        let centerY = view.centerYAnchor.constraint(equalTo: base.centerYAnchor, constant: point.y)

        NSLayoutConstraint.activate([centerX, centerY])

        var width: NSLayoutConstraint?
        var height: NSLayoutConstraint?
        if let size = size {
            let w = view.widthAnchor.constraint(equalToConstant: size.width)
            let h = view.heightAnchor.constraint(equalToConstant: size.height)
            NSLayoutConstraint.activate([w, h])
            width = w
            height = h
        }

        return (centerX: centerX, centerY: centerY, width: width, height: height)
    }

    public func addAutoLayoutedSubview(_ view: UIView, constraints: [NSLayoutConstraint]) {
        addAutoLayoutedSubview(view)
        NSLayoutConstraint.activate(constraints)
    }

    private func addAutoLayoutedSubview(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        base.addSubview(view)
    }
}
