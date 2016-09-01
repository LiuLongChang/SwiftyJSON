//
//  UIImage+Extension.swift
//  CarNews
//
//  Created by langyue on 16/8/31.
//  Copyright © 2016年 langyue. All rights reserved.
//

import Foundation
import UIKit



extension UIImage{


    class func image_Color(color:UIColor,size: CGSize) -> UIImage?{
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width, size.height), true, UIScreen.mainScreen().scale)
        color.set()
        UIRectFill(CGRectMake(0, 0, size.width, size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }


}