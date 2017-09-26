//
//  UIViewController.extension.swift
//  AutoLayoutExtension
//
//  Created by mono on 2017/09/26.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation

extension UIViewController: AutoLayoutExtensionCompatible { }

extension AutoLayoutExtension where Base: UIViewController {

    @discardableResult
    public func addFilledSubviewSafely(_ view: UIView, insets: UIEdgeInsets = .zero) -> FilledResult {

        base.view.ale.addAutoLayoutedSubview(view)

        let top: NSLayoutConstraint
        let left: NSLayoutConstraint
        let bottom: NSLayoutConstraint
        let right: NSLayoutConstraint

        if #available(iOS 11.0, *) {
            let safeAreaLayoutGuide = base.view.safeAreaLayoutGuide
            top = view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: insets.top)
            left = view.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: insets.left)
            bottom = view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -insets.bottom)
            right = view.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -insets.right)
        } else {
            top = view.topAnchor.constraint(equalTo: base.topLayoutGuide.bottomAnchor, constant: insets.top)
            left = view.leftAnchor.constraint(equalTo: base.view.leftAnchor, constant: insets.left)
            bottom = view.bottomAnchor.constraint(equalTo: base.bottomLayoutGuide.topAnchor, constant: -insets.bottom)
            right = view.rightAnchor.constraint(equalTo: base.view.rightAnchor, constant: -insets.right)
        }

        [top, left, bottom, right].activate()

        return (top: top, left: left, bottom: bottom, right: right)
    }
}
