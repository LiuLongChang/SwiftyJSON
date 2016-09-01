//
//  HeadImgModel.swift
//  CarNews
//
//  Created by langyue on 16/9/1.
//  Copyright © 2016年 langyue. All rights reserved.
//

import Foundation


struct HeadImgModel {


    var type : Int?
    var newsLink: String?
    var statusUrl: String?
    var id : Int?
    var webLink: String?
    var pubTime: String?
    var pageNum: String?
    var imgURL: String?
    var title: String?

    typealias SuccessBlock = (headImgModelList: [HeadImgModel]?)->()



    init(dict: [String:AnyObject]){
        newsLink = dict["newsLink"] as? String
        statusUrl = dict["statisticsUrl"] as? String
        webLink = dict["webLink"] as? String
        pubTime = dict["pubTime"] as? String
        pageNum = dict["pageNum"] as? String
        imgURL = dict["imgURL"] as? String
        title = dict["title"] as? String
        type = dict["type"] as? Int
        id = dict["id"] as? Int
    }

}


