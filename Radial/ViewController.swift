//
//  ViewController.swift
//  Radial
//
//  Created by Oisín Lavery on 12/9/15.
//  Copyright © 2015 Oisín Lavery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var radialLayoutView: RadialLayoutView!
  @IBOutlet var menuButton: UIButton!

  override func viewDidLoad() {

    menuButton.layer.cornerRadius = menuButton.bounds.height / 2

    for _ in 1...4 {
      radialLayoutView.addView(createView())
    }

  }

  @IBAction func menuButtonTapped(sender: AnyObject) {
    radialLayoutView.toggle()
  }

  @IBAction func addButtonTapped(sender: AnyObject) {
    let view = createView()
    radialLayoutView.addView(view)
  }
  @IBAction func removeButtonTapped(sender: AnyObject) {

    radialLayoutView.removeView2()
  }
}

extension ViewController {


  func createView() -> UIView {

    let view = UIView(frame: CGRect(x: 0, y: 0, width: 48, height: 48))

    view.backgroundColor = UIColor.blackColor()
    view.layer.cornerRadius = view.bounds.width / 2
    //    view.layer.shouldRasterize = true

    return view
  }

}

