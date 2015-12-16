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

    radialLayoutView.animate = false
    
    for _ in 0...4 {
      radialLayoutView.addSubview(createView())
    }
    
    radialLayoutView.animate = true
  }

  @IBAction func menuButtonTapped(sender: AnyObject) {
    radialLayoutView.toggle()
  }

  @IBAction func addButtonTapped(sender: AnyObject) {
    let view = createView()
    let randomIndex = Int.random(0...radialLayoutView.subviews.count)
    radialLayoutView.insertSubview(view, atIndex: randomIndex)
  }
}

extension ViewController {


  func createView() -> UIView {

    let view = UIView(frame: CGRect(x: 0, y: 0, width: 48, height: 48))

    view.backgroundColor = UIColor.blackColor()
    view.layer.cornerRadius = view.bounds.width / 2
    
    let tapRecognizer = UITapGestureRecognizer(target: self, action: "removeView:")
    view.addGestureRecognizer(tapRecognizer)

    return view
  }
  
  
  func removeView(sender: UITapGestureRecognizer) {
    
    let view = sender.view!

    view.removeFromSuperview()
    
    UIView.animateWithDuration(0.3, delay: 0, options: [.AllowUserInteraction], animations: {
      
      view.alpha = 0
      view.transform = CGAffineTransformMakeScale(1.5, 1.5)
      
      }, completion: { finished in
        
        view.removeFromSuperview()
    })
  }

}

