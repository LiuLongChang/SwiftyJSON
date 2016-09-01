//
//  DataModel.swift
//  CarNews
//
//  Created by langyue on 16/9/1.
//  Copyright © 2016年 langyue. All rights reserved.
//

import Foundation



struct DataModel {

    var newsId:Int?
    var newsTitle:String?
    var newsLink:String?
    var isSpread:Int?
    var newsType:Int?
    var pubTime:String?
    var webLink:String?
    var newsCategory:String?
    var newsCreateTime:String?
    var newsImage:String?
    var commentCount:Int?


    init(dict: [String: AnyObject]){
        newsTitle = dict["newsTitle"] as? String
        newsLink = dict["newsLink"] as? String
        pubTime = dict["pubTime"] as? String
        webLink = dict["webLink"] as? String
        newsCategory = dict["newsCategory"] as? String
        newsCreateTime = dict["newsCreateTime"] as? String
        newsImage = dict["newsImage"] as? String
        commentCount = dict["commentCount"] as? Int
    }




}