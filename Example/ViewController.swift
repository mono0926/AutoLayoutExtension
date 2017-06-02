//
//  ViewController.swift
//  Example
//
//  Created by mono on 2017/06/02.
//  Copyright © 2017 mono. All rights reserved.
//

import UIKit
import AutoLayoutExtension

class ViewController: UIViewController {
    let labelFilled = UILabel()
    let buttonFilled = UIButton(type: UIButtonType.system)
    let viewFilledOuter = UIView()
    let viewFilledInner = UIView()
    var viewFilledInnerConstrains: FilledResult!
    let labelCentered = UILabel()
    let viewCenteredOuter = UIView()
    let viewCenteredInner = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Filled
        labelFilled.text = "Filled:"
        view.ale.addAutoLayoutedSubview(labelFilled, constraints: [
            labelFilled.leftAnchor.constraint(equalTo: view.leftAnchor),
            labelFilled.topAnchor.constraint(equalTo: view.topAnchor, constant: 20)
            ])
        viewFilledOuter.backgroundColor = .black
        view.ale.addAutoLayoutedSubview(viewFilledOuter, constraints: [
            viewFilledOuter.topAnchor.constraint(equalTo: labelFilled.bottomAnchor, constant: 10),
            viewFilledOuter.leftAnchor.constraint(equalTo: view.leftAnchor),
            viewFilledOuter.widthAnchor.constraint(equalToConstant: 100),
            viewFilledOuter.heightAnchor.constraint(equalToConstant: 100),
            ])
        viewFilledInner.backgroundColor = .red
        viewFilledInnerConstrains = viewFilledOuter.ale.addFilledSubview(viewFilledInner,
                                             insets: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
        buttonFilled.setTitle("Move to right", for: .normal)
        view.ale.addAutoLayoutedSubview(buttonFilled, constraints: [
            buttonFilled.leftAnchor.constraint(equalTo: view.leftAnchor),
            buttonFilled.topAnchor.constraint(equalTo: viewFilledOuter.bottomAnchor)
            ])
        buttonFilled.addTarget(self, action: #selector(moveRightDidTap(_:)), for: .touchUpInside)

        // Centered:
        labelCentered.text = "Centered:"
        view.ale.addAutoLayoutedSubview(labelCentered, constraints: [
            labelCentered.leftAnchor.constraint(equalTo: view.leftAnchor),
            labelCentered.topAnchor.constraint(equalTo: buttonFilled.bottomAnchor, constant: 20)
            ])
        viewCenteredOuter.backgroundColor = .black
        view.ale.addAutoLayoutedSubview(viewCenteredOuter, constraints: [
            viewCenteredOuter.topAnchor.constraint(equalTo: labelCentered.bottomAnchor, constant: 10),
            viewCenteredOuter.leftAnchor.constraint(equalTo: view.leftAnchor),
            viewCenteredOuter.widthAnchor.constraint(equalToConstant: 100),
            viewCenteredOuter.heightAnchor.constraint(equalToConstant: 100),
            ])
        viewCenteredInner.backgroundColor = .red
        viewCenteredOuter.ale.addCenteredSubview(viewCenteredInner,
                                                 offset: CGPoint(x: 10, y: 20), size: CGSize(width: 60, height: 40))


    }

    func moveRightDidTap(_ sender: UIButton) {
        let offset: CGFloat = 50
        viewFilledInnerConstrains.right.constant += offset
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        }){ finished in
            self.viewFilledInnerConstrains.left.constant += offset
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
    }
}

