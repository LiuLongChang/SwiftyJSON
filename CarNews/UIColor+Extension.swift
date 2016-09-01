//
//  UIColor+Extension.swift
//  CarNews
//
//  Created by langyue on 16/8/31.
//  Copyright © 2016年 langyue. All rights reserved.
//

import Foundation
import UIKit



extension UIColor{

    class func color_RGBA(R:Float,G:Float,B:Float,A:Float = 1.0) ->UIColor {
        return UIColor.init(red: CGFloat(R/255.0), green: CGFloat(G/255.0), blue: CGFloat(B/255.0), alpha: CGFloat(A))
    }

}