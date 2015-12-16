//
//  RadialLayoutView.swift
//  Radial
//
//  Created by Oisín Lavery on 12/9/15.
//  Copyright © 2015 Oisín Lavery. All rights reserved.
//

import UIKit

class RadialLayoutView: UIView {
  
  var animate = true
  var open = true
  
  private var middle = CGPoint()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  func setup() {
    middle = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
  }
  
  override func addSubview(view: UIView) {
    view.center = middle
    super.addSubview(view)
    setRadialLayout()
  }
  
  override func insertSubview(view: UIView, atIndex index: Int) {
    view.center = middle
    super.insertSubview(view, atIndex: index)
    setRadialLayout()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setRadialLayout()
  }
}


extension RadialLayoutView {
  
  func setRadialLayout() {
    
    var angle = 0.0
    
    for view in subviews {
      
      let sine: CGFloat = CGFloat(sin(Float(angle)))
      let cosine: CGFloat = CGFloat(cos(Float(angle)))
      let r: CGFloat = (bounds.width / 2) - (view.bounds.width / 2)
      let x: CGFloat = sine * r
      let y: CGFloat = cosine * r
      
      angle += Double((360.0 / Double(subviews.count)) * 3.14/180.0)
      
      let point = CGPoint(x: middle.x - x, y: middle.y - y)
      
      if (animate) {
        UIView.animateWithDuration(0.3, delay: 0, options: [.AllowUserInteraction], animations: {
          view.center = point
          }, completion: nil)
      }
      else {
        view.center = point
      }
      
    }
  }
  
  func setCenterLayout() {
    
    for view in subviews {
      
      if (animate) {
        UIView.animateWithDuration(0.3, delay: 0, options: [.AllowUserInteraction], animations: {
          view.center = self.middle
          }, completion: nil)
      }
      else {
        view.center = middle
      }
    }
  }
}


extension RadialLayoutView {
  
  func toggle() {
    
    if (open) {
      setCenterLayout()
    }
    else {
      setRadialLayout()
    }
    
    open = !open
  }
  
}
