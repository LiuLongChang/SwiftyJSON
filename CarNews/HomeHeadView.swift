//
//  HomeHeadView.swift
//  CarNews
//
//  Created by langyue on 16/9/1.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit

class HomeHeadView: UICollectionReusableView {

    typealias Block = (HeadImgModel)->()
    var lcScrollView:LCScrollView?
    var tapClickBlock:Block?

    override init(frame: CGRect) {
        super.init(frame: frame)

        lcScrollView = LCScrollView(frame: CGRectMake(0,0,kScreenWidth,bounds.height))
        self.addSubview(lcScrollView!)
        lcScrollView?.tapClickBlock = { model in

            if self.tapClickBlock != nil {
                self.tapClickBlock!(model)
            }

        }

    }


    func setHeadViewWith(headArr:[HeadImgModel]){
        lcScrollView?.configureScrollView(headArr)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

        
}
