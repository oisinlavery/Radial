//
//  ViewController.swift
//  Radial
//
//  Created by Oisín Lavery on 12/9/15.
//  Copyright © 2015 Oisín Lavery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var radialLayoutView: RadialLayoutView!

  override func viewDidLoad() {

    print("asdfasdfasd")

    radialLayoutView = RadialLayoutView(frame: self.view.frame)
    self.view.insertSubview(radialLayoutView, atIndex: 0)

    for _ in 1...6 {
      radialLayoutView.addView(createView())
    }

  }

  func createView() -> UIView {
    //        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))

    //        let view = UIButton()
    //
    //        view.setTitle("my button", forState: .Normal)
    //        view.titleLabel?.font = UIFont.systemFontOfSize(10)
    //        view.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    //        view.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    //        view.sizeToFit()

    let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))

    view.backgroundColor = UIColor.randomColor()
    view.layer.cornerRadius = 25
    view.layer.shouldRasterize = true

    return view
  }

  @IBAction func addButtonTapped(sender: AnyObject) {
    let view = createView()
    radialLayoutView.addView(view)
  }
  @IBAction func contractButtonTapped(sender: AnyObject) {

    radialLayoutView.toggle()
  }
}

