//
//  UIFont+Extension.swift
//  CarNews
//
//  Created by langyue on 16/8/31.
//  Copyright © 2016年 langyue. All rights reserved.
//

import Foundation
import UIKit


extension UIFont{

    class func font_Size(size: CGFloat) -> UIFont {
        if let font = UIFont.init(name: "BigYoungMediumBG2.0", size: size){
            return font
        }
        return UIFont.systemFontOfSize(size)
    }

}



