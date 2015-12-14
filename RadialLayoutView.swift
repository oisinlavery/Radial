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

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    radialLayout()
  }

  func addView(view: UIView) {

    let tapRecognizer = UITapGestureRecognizer(target: self, action: "removeView:")
    view.addGestureRecognizer(tapRecognizer)

    view.alpha = 0
    view.center.x = center.x
    view.center.y = center.y

    insertSubview(view, atIndex: 0)
  }

  func removeView(sender: UITapGestureRecognizer) {
    let view = sender.view!

    view.alpha = 1

    UIView.animateWithDuration(0.5, animations: {

      //            view.transform = CGAffineTransformMakeScale(2, 2)
      view.alpha = 0

      }, completion: { finished in

        view.removeFromSuperview()
    })

  }

  func radialLayout() {

    var angle = 0.0

    for view in subviews {

      let sine: CGFloat = CGFloat(sin(Float(angle)))
      let cosine: CGFloat = CGFloat(cos(Float(angle)))
      let r: CGFloat = (bounds.width / 2) - (view.bounds.width / 2)
      let x: CGFloat = sine * r
      let y: CGFloat = cosine * r


      angle += Double((360.0 / Double(subviews.count)) * 3.14/180.0)

      UIView.animateWithDuration(0.3, animations: {
        view.alpha = 1
        view.center.x = self.center.x - x
        view.center.y = self.center.y - y
      })

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
          view.center.x = self.center.x
          view.center.y = self.center.y
          }, completion: nil)
        
      }
    }
    else {
      radialLayout()
    }

    open = !open
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
