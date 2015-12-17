//
//  Chat.swift
//  Liaotian
//
//  Created by qzp on 15/11/10.
//  Copyright © 2015年 qzp. All rights reserved.
//

import UIKit

enum MessageType: Int {
    case Text //文本
    case Link //连接
}

class Chat: NSObject {
    var name: String!
    var date: String!
    var photo: String?
    var message: String!
    var linkUrl: String?
    var linkThumbUrl: String?
    var type: MessageType!
    var picUrls: NSArray?
    

}

