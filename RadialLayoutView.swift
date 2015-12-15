//
//  RadialLayoutView.swift
//  Radial
//
//  Created by Oisín Lavery on 12/9/15.
//  Copyright © 2015 Oisín Lavery. All rights reserved.
//

import UIKit

class RadialLayoutView: UIView {

  var open = true
  var middle = CGPoint()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  func setup() {
    middle.x = CGFloat(bounds.width / 2)
    middle.y = CGFloat(bounds.height / 2)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    calculateLayout()
  }

  func addView(view: UIView) {

    let tapRecognizer = UITapGestureRecognizer(target: self, action: "removeView:")
    view.addGestureRecognizer(tapRecognizer)

    view.alpha = 0

    view.center.x = middle.x
    view.center.y = middle.y

    let randomIndex = Int.random(0...subviews.count)

    insertSubview(view, atIndex: randomIndex)

    open = true
  }

  func removeView(sender: UITapGestureRecognizer) {
    let view = sender.view!

    view.alpha = 1
    view.transform = CGAffineTransformMakeScale(1, 1)

    UIView.animateWithDuration(1, delay: 0.5, options: [], animations: {

      view.alpha = 0
      view.transform = CGAffineTransformMakeScale(0.5, 0.5)

      }, completion: { finished in

        view.removeFromSuperview()
    })
    
  }

  func removeView2() {
    let view = subviews.first!

    view.alpha = 1
    view.transform = CGAffineTransformMakeScale(1, 1)

    UIView.animateWithDuration(1, delay: 0.5, options: [], animations: {

      view.alpha = 0
      view.transform = CGAffineTransformMakeScale(0.5, 0.5)

      }, completion: { finished in

        view.removeFromSuperview()
    })
    
  }

  func calculateLayout() {

    var angle = 0.0

    for view in subviews {

      let sine: CGFloat = CGFloat(sin(Float(angle)))
      let cosine: CGFloat = CGFloat(cos(Float(angle)))
      let r: CGFloat = (bounds.width / 2) - (view.bounds.width / 2)
      let x: CGFloat = sine * r
      let y: CGFloat = cosine * r

      angle += Double((360.0 / Double(subviews.count)) * 3.14/180.0)

//      UIView.animateWithDuration(0.3, animations: {
//        view.alpha = 1
//        view.center.x = self.middle.x - x
//        view.center.y = self.middle.y - y
//      })

      UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 1, options: [],
        animations: {
          view.alpha = 1
          view.center.x = self.middle.x - x
          view.center.y = self.middle.y - y
        },
        completion: nil)
    }
  }

  func toggle() {

    if (open) {

      for view in subviews {

        let delay = 0.0

        UIView.animateWithDuration(0.2, delay: delay, options: [], animations: {
          view.alpha = 0
          }, completion: nil)

        UIView.animateWithDuration(0.3, delay: delay, options: [], animations: {
          view.center.x = self.middle.x
          view.center.y = self.middle.y
          }, completion: nil)
        
      }
    }
    else {
      calculateLayout()
    }

    open = !open
  }
}
