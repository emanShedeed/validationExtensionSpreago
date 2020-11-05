//
//  UIViewExtension.swift
//  Ataba
//
//  Created by eman shedeed on 8/22/19.
//  Copyright © 2019 eman shedeed. All rights reserved.
//

import UIKit
typealias GradientPoints = (startPoint: CGPoint, endPoint: CGPoint)
//set the start and the end of graiant
enum GradientOrientation {
    case topRightBottomLeft
    case topLeftBottomRight
    case horizontal
    case vertical
    
    var startPoint : CGPoint {
        return points.startPoint
    }
    
    var endPoint : CGPoint {
        return points.endPoint
    }
    
    var points : GradientPoints {
        switch self {
        case .topRightBottomLeft:
            return (CGPoint(x: 0.0,y: 1.0), CGPoint(x: 1.0,y: 0.0))
        case .topLeftBottomRight:
            return (CGPoint(x: 0.0,y: 0.0), CGPoint(x: 1,y: 1))
        case .horizontal:
            return (CGPoint(x: 0.0,y: 0.5), CGPoint(x: 1.0,y: 0.5))
        case .vertical:
            return (CGPoint(x: 0.0,y: 0.0), CGPoint(x: 0.0,y: 1.0))
        }
    }
    
}
@IBDesignable
extension UIView {
    //to make button color between two colors
    func applyGradient(with colours: [UIColor], locations: [NSNumber]? = nil) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func applyGradient(with colours: [UIColor], gradient orientation: GradientOrientation) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.startPoint = orientation.startPoint
        gradient.endPoint = orientation.endPoint
        gradient.cornerRadius = self.layer.cornerRadius
        clipsToBounds = true
        self.layer.insertSublayer(gradient, at: 0)
    }
//    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
//        if #available(iOS 11.0, *) {
//            clipsToBounds = true
//            layer.cornerRadius = radius
//            layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
//        } else {
//            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//            let mask = CAShapeLayer()
//            mask.path = path.cgPath
//            layer.mask = mask
//        }
//    }
  
    func addBorderWith(borderColor:UIColor,borderWith:CGFloat,borderCornerRadius:CGFloat){
        self.layer.borderWidth = borderWith
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = borderCornerRadius
        clipsToBounds = true

    }
  
    func applyShadowWithCornerRadiusAndGradients(cornerRadius:CGFloat,borderColor:UIColor,borderWidth:CGFloat,with colours: [UIColor],gradient orientation: GradientOrientation, shadowOffset: CGSize,shadowColor:UIColor,shadowOpacity:Float,shadowRadius:CGFloat){
        self.backgroundColor = UIColor.clear
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        
        
        // add the border to subview
        let borderView = UIView()
        borderView.frame = self.bounds
        borderView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        borderView.layer.cornerRadius = cornerRadius
        borderView.layer.borderColor = borderColor.cgColor
        borderView.layer.borderWidth = borderWidth
        borderView.layer.masksToBounds = true
        borderView.clipsToBounds = true
        self.addSubview(borderView)
//
        //add gradient to bordered view
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.startPoint = orientation.startPoint
        gradient.endPoint = orientation.endPoint
        gradient.cornerRadius = self.layer.cornerRadius
        borderView.layer.addSublayer(gradient)

        borderView.isUserInteractionEnabled = false
        
        if (self is UIButton){
            let button = self as! UIButton
          if let imageView = button.imageView{
                self.bringSubviewToFront(imageView)
            }
        }
    
    }
    func addBlurEffect(blurEffectStyle:UIBlurEffect.Style)
    {
        let blurEffect = UIBlurEffect(style: blurEffectStyle)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }
    func setRadius(radius: CGFloat? = nil) {
         self.layer.cornerRadius = radius ?? self.frame.width / 2;
         self.layer.masksToBounds = true;
     }
}

