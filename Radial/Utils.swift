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
        let r = randomCGFloat()
        let g = randomCGFloat()
        let b = randomCGFloat()

        // If you wanted a random alpha, just create another
        // random number for that too.
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}

func randomCGFloat() -> CGFloat {
    return CGFloat(arc4random()) / CGFloat(UInt32.max)
}