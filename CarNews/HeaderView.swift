//
//  HeaderView.swift
//  CarNews
//
//  Created by langyue on 16/9/1.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    class func loadFromNib()->HeaderView{
        return NSBundle.mainBundle().loadNibNamed("Header", owner: self, options: nil).last as! HeaderView

    }





}
