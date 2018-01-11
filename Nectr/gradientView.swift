//
//  gradientView.swift
//  Nectr
//
//  Created by James McNab on 2015-06-01.
//  Copyright (c) 2015 James McNab. All rights reserved.
//

import UIKit

@IBDesignable class gradientView: UIView {
    /*
    let startColor = UIColor(red: 250/255, green: 217/255, blue: 97/255, alpha: 1)
    let endColor = UIColor(red: 247/255, green: 107/255, blue: 28/255, alpha: 1)
    
    override func drawRect(rect: CGRect) {
        let currentContext = UIGraphicsGetCurrentContext()
        
        CGContextSaveGState(currentContext)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        
        var startColorComponents = CGColorGetComponents(startColor.CGColor)
        var endColorComponents = CGColorGetComponents(endColor.CGColor)
        
        var colorComponents = [startColorComponents[0], startColorComponents[1], startColorComponents[2], startColorComponents[3], endColorComponents[0], endColorComponents[1], endColorComponents[2], endColorComponents[3]]
        
        var locations:[CGFloat] = [0.0, 1.0]
        
        let gradient = CGGradientCreateWithColorComponents(colorSpace, &colorComponents, &locations, 2)
        
        let startPoint = CGPoint.zeroPoint
        let endPoint = CGPoint(x:0, y:self.bounds.height)
        
        CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0)
        
        CGContextRestoreGState(currentContext)
        
    }
*/
}