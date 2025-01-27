//
//  UIViewController+Utils.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 27/01/2025.
//

import UIKit
import Localize_Swift

extension UIViewController {
    // animate an image with a zoom in
    func animateZoomIn(imageView: UIImageView) {
        UIView.animate(withDuration: 1) {
            let size = self.view.frame.size.width * 2
            let diffX = size - self.view.frame.width
            let diffY = self.view.frame.height - size

            imageView.frame = CGRect(
                x: -(diffX/2),
                y: diffY/2,
                width: size,
                height: size)
            imageView.alpha = 0
        }
    }
}
