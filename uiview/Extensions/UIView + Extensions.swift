//
//  UIView + Extensions.swift
//  uiview
//
//  Created by macbook on 15.10.2023.
//

import UIKit

// MARK: - Custom Add View

extension UIView {
    
    func addView(_ view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

