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

        [top, left, bottom, right].activate()

        return (top: top, left: left, bottom: bottom, right: right)
    }

    @discardableResult
    public func addCenteredSubview(_ view: UIView, offset point: CGPoint = .zero, size: CGSize? = nil) -> CenteredResult {

        addAutoLayoutedSubview(view)
        let centerX = view.centerXAnchor.constraint(equalTo: base.centerXAnchor, constant: point.x)
        let centerY = view.centerYAnchor.constraint(equalTo: base.centerYAnchor, constant: point.y)

        var width: NSLayoutConstraint?
        var height: NSLayoutConstraint?
        if let size = size {
            width = view.widthAnchor.constraint(equalToConstant: size.width)
            height = view.heightAnchor.constraint(equalToConstant: size.height)
        }

        [centerX, centerY, width, height].flatMap { $0 }.activate()

        return (centerX: centerX, centerY: centerY, width: width, height: height)
    }

    public func addAutoLayoutedSubview(_ view: UIView, constraints: [NSLayoutConstraint]) {
        addAutoLayoutedSubview(view)
        constraints.activate()
    }

    func addAutoLayoutedSubview(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        base.addSubview(view)
    }

    /// https://qiita.com/_ha1f/items/5ca6892a9115b92de288
    public func layoutGuideSafeOrDefault() -> UILayoutGuide {
        if #available(iOS 11.0, *) {
            return base.safeAreaLayoutGuide
        } else {
            return UIViewLayoutGuideProxy(base)
        }
    }

    public func insetsSafeOrDefault() -> UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return base.safeAreaInsets
        } else {
            return .zero
        }
    }
}

extension UIView {
    public static let standardSpacing: CGFloat = 8

    public static func additionalCGFloatForUnderIOS11(_ value: CGFloat) -> CGFloat {
        if #available(iOS 11.0, *) {
            return 0
        } else {
            return value
        }
    }

    public static func standardSpacingForUnderIOS11() -> CGFloat {
        return additionalCGFloatForUnderIOS11(standardSpacing)
    }
}
