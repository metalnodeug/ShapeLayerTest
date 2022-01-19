//
//  BezierShape.swift
//  ShapeLayerTest
//
//  Created by MeTaLnOdEuG on 19/01/2022.
//

import UIKit

@IBDesignable class CurvedHeaderView: UIView {
    
    @IBInspectable var curveHeight:CGFloat = 50.0
    
    var curvedLayer = CAShapeLayer()
    
    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addArc(withCenter: CGPoint(x: CGFloat(rect.width) - curveHeight, y: rect.height), radius: curveHeight, startAngle: 0, endAngle: 1.5 * CGFloat.pi, clockwise: false)
        path.addLine(to: CGPoint(x: curveHeight, y: rect.height - curveHeight))
        path.addArc(withCenter: CGPoint(x: curveHeight, y: rect.height), radius: curveHeight, startAngle: -96, endAngle:  CGFloat.pi, clockwise: false)
        
        path.close()
        
        curvedLayer.path = path.cgPath
        curvedLayer.fillColor = UIColor(red: 8/255, green: 95/255, blue: 189/255, alpha: 1.0).cgColor
        curvedLayer.frame = rect
        curvedLayer.shadowOffset = CGSize(width: 0, height: 10)
        curvedLayer.shadowColor = UIColor.black.cgColor
        curvedLayer.shadowRadius = 10.0
        curvedLayer.shadowOpacity = 0.4
        
        self.layer.insertSublayer(curvedLayer, at: 0)
    }
    
}
