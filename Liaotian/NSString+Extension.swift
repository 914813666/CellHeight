//
//  NSString+Extension.swift
//  Liaotian
//
//  Created by qzp on 15/11/10.
//  Copyright © 2015年 qzp. All rights reserved.
//

import UIKit

extension String {
    func getSize(size: CGSize, font: UIFont) -> CGSize {

    
        var textSize:CGSize!
        
        if CGSizeEqualToSize(size, CGSizeZero) {
            
            let attributes = NSDictionary(object: font, forKey: NSFontAttributeName)
            
            textSize = self.sizeWithAttributes(attributes as! [String : AnyObject] as [String : AnyObject])
            
        } else {
            
            let option = NSStringDrawingOptions.UsesLineFragmentOrigin
            
            let attributes = NSDictionary(object: font, forKey: NSFontAttributeName)
            
            let stringRect = self.boundingRectWithSize(size, options: option, attributes: attributes as! [String : AnyObject] as [String : AnyObject], context: nil)
            
            textSize = stringRect.size
            
        }
        
        return textSize
        
    }
}
