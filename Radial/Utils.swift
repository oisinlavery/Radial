//
//  Utils.swift
//  Wheezy
//
//  Created by Oisín Lavery on 11/25/15.
//  Copyright © 2015 Oisín Lavery. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

  static func randomColor() -> UIColor {

    func randomCGFloat() -> CGFloat {
      return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }

    let r = randomCGFloat()
    let g = randomCGFloat()
    let b = randomCGFloat()

    // If you wanted a random alpha, just create another
    // random number for that too.
    return UIColor(red: r, green: g, blue: b, alpha: 1.0)
  }
}

extension Int
{
  static func random(range: Range<Int> ) -> Int
  {
    var offset = 0

    if range.startIndex < 0   // allow negative ranges
    {
      offset = abs(range.startIndex)
    }

    let mini = UInt32(range.startIndex + offset)
    let maxi = UInt32(range.endIndex   + offset)

    return Int(mini + arc4random_uniform(maxi - mini)) - offset
  }
}


//func randomInt (lower lower: Int , upper: Int) -> Int {
//  return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
//}