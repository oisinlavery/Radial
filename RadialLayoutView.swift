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

  private var views: [UIView]!
  private var middle = CGPoint()

  override init(frame: CGRect) {
    super.init(frame: frame)
    initialize()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initialize()
  }

  func initialize() {
    views = subviews
    middle = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
  }

  override func addSubview(view: UIView) {
    super.addSubview(view)
    views.append(view)

    view.center = middle
    setRadialLayout()
  }

  override func insertSubview(view: UIView, atIndex index: Int) {
    super.insertSubview(view, atIndex: index)
    views.insert(view, atIndex: index)

    view.center = middle
    setRadialLayout()
  }

  func removeView(view: UIView) {

    if let index = views.indexOf(view) {
      views.removeAtIndex(index)
      setRadialLayout()
    }

    UIView.animateWithDuration(0.3, delay: 0, options: [.AllowUserInteraction], animations: {

//      view.alpha = 0
//      view.transform = CGAffineTransformMakeScale(5, 5)
      view.center = self.middle

      }, completion: { finished in

        view.removeFromSuperview()
        self.setRadialLayout()
    })
  }
}


extension RadialLayoutView {

  func setRadialLayout() {

    var angle = 0.0

    for view in views {

      let sine: CGFloat = CGFloat(sin(Float(angle)))
      let cosine: CGFloat = CGFloat(cos(Float(angle)))
      let r: CGFloat = (bounds.width / 2) - (view.bounds.width / 2)
      let x: CGFloat = sine * r
      let y: CGFloat = cosine * r

      angle += Double((360.0 / Double(views.count)) * 3.14/180.0)

      let point = CGPoint(x: middle.x - x, y: middle.y - y)

      if (animate) {

        let animation = CABasicAnimation(keyPath: "position")
        animation.toValue = NSValue(CGPoint: point)
        animation.duration = 1
        animation.timeOffset = 0.5
        view.layer.addAnimation(animation, forKey: "position")

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

    for view in views {

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
