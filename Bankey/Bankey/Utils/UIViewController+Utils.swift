//
//  UIViewController+Utils.swift
//  Bankey
//
//  Created by Jean Ricardo Cesca on 29/07/22.
//

import Foundation
import UIKit

extension UIViewController {
    func setStatusBar() {
        let statusBarSize = UIApplication.shared.statusBarFrame.size // deprecated but OK
        let frame = CGRect(origin: .zero, size: statusBarSize)
        let statusbarView = UIView(frame: frame)

        statusbarView.backgroundColor = UIColor(named: "color")
        view.addSubview(statusbarView)
    }
}
