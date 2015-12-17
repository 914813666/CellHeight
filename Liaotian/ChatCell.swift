//
//  ChatCell.swift
//  Liaotian
//
//  Created by qzp on 15/11/10.
//  Copyright © 2015年 qzp. All rights reserved.
//

import UIKit
import Kingfisher
let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
let PHOTO_BUTTON_WIDTH: CGFloat = 40
let PHOTO_BUTTON_LEFT: CGFloat = 10
let PRE_TO_NEXT_DISTANCE: CGFloat = 8

let BUTTON_NUMBEER: Int = 3

class ChatCell: UITableViewCell {
    
    var photoButton: UIButton!
    var nameButton: UIButton!
    var contentLabel: UILabel!
    var commentTableView: UITableView!
    var loveButton, commentButton: UIButton!
    var imageBgView: UIView!
    
    var tableView: UITableView!

    private var chat: Chat!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
        photoButton = UIButton(frame: CGRectMake(PHOTO_BUTTON_LEFT, PHOTO_BUTTON_LEFT, PHOTO_BUTTON_WIDTH, PHOTO_BUTTON_WIDTH))
        photoButton.layer.cornerRadius = CGRectGetHeight(photoButton.bounds)/2
        photoButton.clipsToBounds = true
        self.contentView.addSubview(photoButton)
        
        
        let leftDistance = CGRectGetMaxX(photoButton.frame) + PRE_TO_NEXT_DISTANCE
        
        nameButton = UIButton(type: .Custom)
        nameButton.frame = CGRectMake(leftDistance, PHOTO_BUTTON_LEFT, SCREEN_WIDTH - leftDistance, CGRectGetHeight(photoButton.bounds))
        nameButton.contentHorizontalAlignment = .Left
        nameButton.setTitleColor(UIColor ( red: 0.1782, green: 0.5778, blue: 0.1346, alpha: 1.0 ), forState: .Normal)
        self.contentView.addSubview(nameButton)
        
        contentLabel = UILabel()
        contentLabel.lineBreakMode = .ByCharWrapping
        contentLabel.numberOfLines = -1
        self.contentView.addSubview(contentLabel)
        
        imageBgView = UIView()
        self.contentView.addSubview(imageBgView)
        
        loveButton = UIButton()
        loveButton.setImage(UIImage(named: "topic_comment_icon"), forState: .Normal)
        self.contentView.addSubview(loveButton)
        loveButton.backgroundColor = UIColor.lightGrayColor()
       
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    
    func setCell(chat: Chat) {
        
        self.chat = chat
        
        let leftDistance = CGRectGetMaxX(photoButton.frame) + PRE_TO_NEXT_DISTANCE
        
        photoButton.kf_setBackgroundImageWithURL(NSURL(string: chat.photo!)!, forState: .Normal)
        
        nameButton.setTitle( chat.name, forState: .Normal)
        
        let oldSize = CGSizeMake(SCREEN_WIDTH - leftDistance - PRE_TO_NEXT_DISTANCE , 999)
        
        let newHeight = self.heightForText(self.chat)
        let newSize = CGSizeMake(oldSize.width, newHeight)
        
        
        contentLabel.frame = CGRectMake(leftDistance, CGRectGetMaxY(nameButton.bounds) + 8, newSize.width, newSize.height)
        contentLabel.text = chat.message
        
        let btn_Witdh = oldSize.width / CGFloat(BUTTON_NUMBEER)
        let btn_Top = CGRectGetMaxY(contentLabel.frame) + 2
        
        
        var imagBgViewHeight: CGFloat = 0
        if let imgs = chat.picUrls {
            imageBgView.hidden = false
            var i: Int = 0
            for imgUrl in imgs  {
                let btn = UIButton(frame: CGRectMake(CGFloat(i % BUTTON_NUMBEER) * btn_Witdh  , btn_Witdh * CGFloat(i / BUTTON_NUMBEER), btn_Witdh - 5, btn_Witdh - 5))
                
                btn.kf_setBackgroundImageWithURL(NSURL(string: imgUrl as! String)!, forState: .Normal)
                self.imageBgView.addSubview(btn)
                
                i++
            }
            imagBgViewHeight =   self.heightForImageView(self.chat)
        } else {
            imageBgView.hidden = true
        }
        imageBgView.frame =  CGRectMake(leftDistance, btn_Top, oldSize.width, imagBgViewHeight)
        
        let topLoveButton: CGFloat = CGRectGetMaxY(imageBgView.frame)
        
        //love
        loveButton.frame = CGRectMake(leftDistance, topLoveButton, 40, 20)
        loveButton.layer.cornerRadius = CGRectGetHeight(loveButton.frame) / 2
        
    }
    
    
    //所有图片的高度
     func heightForImageView(char: Chat) -> CGFloat {
        var imgViewAllHeight: CGFloat = 0
        
        if let imgs = char.picUrls {
            let leftDistance: CGFloat = 40  + PRE_TO_NEXT_DISTANCE
            let oldSize = CGSizeMake(SCREEN_WIDTH - leftDistance - PRE_TO_NEXT_DISTANCE , 9999)
            let btn_Witdh = oldSize.width / CGFloat(BUTTON_NUMBEER)
            imgViewAllHeight = CGFloat(ceilf((Float(imgs.count) / Float(BUTTON_NUMBEER)))) * btn_Witdh
        }
        
        
        return imgViewAllHeight
        
    }
    
    //所有文本的高度
      func heightForText(char: Chat) -> CGFloat {
        var height: CGFloat = 0
        let leftDistance:CGFloat = 40 + PRE_TO_NEXT_DISTANCE
        let oldSize = CGSizeMake(SCREEN_WIDTH - leftDistance - PRE_TO_NEXT_DISTANCE , 9999)
        
        let newSize = char.message.getSize(oldSize, font: UIFont.systemFontOfSize(17))

        height = newSize.height
        
        return height
        
    }
    
    
    class func cellHeight(char: Chat) -> CGFloat {
        var cellHeight: CGFloat = 0
        cellHeight += PHOTO_BUTTON_LEFT + PHOTO_BUTTON_WIDTH + PRE_TO_NEXT_DISTANCE //到文本的距离
        cellHeight += self.init().heightForText(char)
//        print(cellHeight)
        cellHeight += self.init().heightForImageView(char)
//        print(cellHeight)
        cellHeight += 20
        
        return cellHeight
    
    }
}
