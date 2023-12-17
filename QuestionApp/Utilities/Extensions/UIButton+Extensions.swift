//
//  UIButton+Extensions.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 17.12.2023.
//

import UIKit

extension UIButton {
    private var activityIndicatorTag: Int { 10001 }

    func state(isProgress: Bool, title: String? = nil) {
        let activityIndicator: UIActivityIndicatorView
        if let indicator = self.viewWithTag(activityIndicatorTag) as? UIActivityIndicatorView {
            activityIndicator = indicator
        } else {
            activityIndicator = UIActivityIndicatorView(style: .medium)
            activityIndicator.tag = activityIndicatorTag
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(activityIndicator)

            NSLayoutConstraint.activate([
                activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
        }

        if isProgress {
            activityIndicator.startAnimating()
            self.setTitle("", for: .normal)
            self.isEnabled = false
        } else {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            self.setTitle(title, for: .normal)
            self.isEnabled = true
        }
    }
    
    func applyBorder(width: CGFloat, color: CGColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color
    }
}

