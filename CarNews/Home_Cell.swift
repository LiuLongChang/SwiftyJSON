//
//  Home_Cell.swift
//  CarNews
//
//  Created by langyue on 16/9/1.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit
import Kingfisher


class Home_Cell: UICollectionViewCell {


    typealias Block = (NSString)->()

    //
    //
    //
    var newsImageView:UIImageView?
    var newsTitle :UILabel?
    var pubTime :UILabel?
    var commentCount :UILabel?
    var block:Block?
    var time:String?




    override init(frame: CGRect) {
        super.init(frame: frame)


        backgroundColor = UIColor.whiteColor()
        newsImageView = UIImageView(frame: CGRectMake(0, 0, bounds.height/3*4, bounds.height))
        newsImageView?.image = UIImage(named: "common_default_100x76")
        newsImageView?.userInteractionEnabled = true
        self.addSubview(newsImageView!)



        newsTitle = UILabel(frame:CGRectMake(10+bounds.height/3*4,5,bounds.width-(10+bounds.height/3*4),20))
        newsTitle?.font = kMainFont
        self.addSubview(newsTitle!)



        pubTime = UILabel(frame:CGRectMake(10+bounds.height/3*4,bounds.height-20,100,20))
        pubTime?.font = kMinFont
        pubTime?.textColor = UIColor.grayColor()
        self.addSubview(pubTime!)



        commentCount = UILabel(frame:CGRectMake(bounds.width-100,bounds.height-20,80,20))
        commentCount?.font = kMinFont
        commentCount?.textColor = UIColor.grayColor()
        self.addSubview(commentCount!)


    }


    func setCell_DataModelArr(dataModel:DataModel){

        newsImageView?.kf_setImageWithURL(NSURL(string: dataModel.newsImage!),placeholderImage: UIImage(named: "common_default_100x76"))
        newsTitle?.text = dataModel.newsTitle
        pubTime?.text = dataModel.pubTime
        commentCount?.text = String(format: "评论:%d",dataModel.commentCount!)

    }







    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
