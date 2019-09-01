//
//  UIView+Extensions.swift
//  ARDemo
//
//  Created by Daniel Reyes Sanchez on 9/1/19.
//  Copyright © 2019 Wizeline. All rights reserved.
//

import UIKit

extension UIView {
    
    /**
             It helps you to programmatically set the constrains of a view.
             You just need to apply it to the view to be set and pass a set of parameters described below:
             - Parameter top: anchor of the view that will be anchored to the top (optional if you pass nil).
             - Parameter left: anchor of the view that will be anchored to the left (optional if you pass nil).
             - Parameter bottom: anchor of the view that will be anchored to the bottom (optional if you pass nil).
             - Parameter right: anchor of the view that will be anchored to the right (optional if you pass nil).
             - Parameter paddingTop: padding from the view's top anchor to the anchored top anchor (optional if you pass 0).
             - Parameter paddingLeft: padding from the view's left anchor to the anchored left anchor (optional if you pass 0).
             - Parameter paddingBottom: padding from the view's bottom anchor to the anchored bottom anchor (optional if you pass 0).
             - Parameter paddingRight: padding from the view's right anchor to the anchored right anchor (optional if you pass 0).
             - Parameter width: fixed width of the view (optional if you pass 0).
             - Parameter width: fixed height of the view (optional if you pass 0).
     
             ### Usage Example: ###
             ````
             viewToBeAnchored.anchor(top: oneView.topAnchor,
                                    left: otherView.leftAnchor,
                                    bottom: nil,
                                    right: otherView.rightAnchor,
                                    paddingTop: 8,
                                    paddingLeft: 16,
                                    paddingBottom: 0,
                                    paddingRight: 16,
                                    width: 0,
                                    height: 0)
             ````
     */
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0.0,
                paddingLeft: CGFloat = 0.0,
                paddingBottom: CGFloat = 0.0,
                paddingRight: CGFloat = 0.0,
                width: CGFloat = 0.0,
                height: CGFloat = 0.0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    /**
            Programmatically pins the view (sets the top, bottom, left and right anchors) to it's parent's anchors with an optional padding.
             - Parameter padding: padding between the view to be anchored and it's parent view.
     */
    func pinToSafeAreaSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = superview?.safeAreaLayoutGuide.topAnchor {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let left = superview?.safeAreaLayoutGuide.leftAnchor {
            leftAnchor.constraint(equalTo: left, constant: padding.left).isActive = true
        }
        if let right = superview?.safeAreaLayoutGuide.rightAnchor {
            rightAnchor.constraint(equalTo: right, constant: -padding.right).isActive = true
        }
        if let bottom = superview?.safeAreaLayoutGuide.bottomAnchor {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
    }
    
    /**
             Programmatically pins the view (sets the top, bottom, left and right anchors) to it's parent's anchors with an optional padding.
             - Parameter padding: padding between the view to be anchored and it's parent view.
     */
    func pinToSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = superview?.topAnchor {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let left = superview?.leftAnchor {
            leftAnchor.constraint(equalTo: left, constant: padding.left).isActive = true
        }
        if let right = superview?.rightAnchor {
            rightAnchor.constraint(equalTo: right, constant: -padding.right).isActive = true
        }
        if let bottom = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
    }
}
