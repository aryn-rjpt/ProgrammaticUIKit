//
//  GradientExtension.swift
//  ProgrammaticPract
//
//  Created by Unthinkable-Mac on 15/05/26.
//

import UIKit

extension CAGradientLayer {
    static func gradientLayer(colors: [CGColor], frame: CGRect, isHorizontal: Bool) -> CAGradientLayer {
        let layer = Self()
        layer.colors = colors
        layer.frame = frame
        if isHorizontal {
            layer.startPoint = CGPoint(x: 0, y: 0.5)
            layer.endPoint = CGPoint(x: 1, y: 0.5)
        }
        return layer
    }
}

