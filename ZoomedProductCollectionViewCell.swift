//
//  ZoomedProductCollectionViewCell.swift
//  Bubble
//
//  Created by killvak on 3/30/16.
//  Copyright © 2016 killvak. All rights reserved.
//

import UIKit

class ZoomedProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var MyCart: UIButton!
    
    @IBOutlet weak var NameOfProduct: UILabel!
    
    @IBOutlet weak var FavButton: UIButton!
    
    @IBOutlet weak var ProductImage: UIImageView!
    
    var app : App? {
        didSet {
            if let name = app?.name {
                NameOfProduct.text = name
                
                //                let rect = NSString(string: name).boundingRectWithSize(CGSizeMake(frame.width, 1000), options: NSStringDrawingOptions.UsesFontLeading.union(NSStringDrawingOptions.UsesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont.systemFontOfSize(14)], context: nil)
                
                //                if rect.height > 20 {
                //                    categoryLabel.frame = CGRectMake(0, frame.width + 38, frame.width, 20)
                //                    priceLabel.frame = CGRectMake(0, frame.width + 56, frame.width, 20)
                //                } else {
                //                    categoryLabel.frame = CGRectMake(0, frame.width + 22, frame.width, 20)
                //                    priceLabel.frame = CGRectMake(0, frame.width + 40, frame.width, 20)
                //                }
                
                //                nameLabel.frame = CGRectMake(0, frame.width + 5, frame.width, 40)
                //                nameLabel.sizeToFit()
                
            }
            
//            categoryLabel.text = app?.category
//            
//            if let price = app?.price {
//                priceLabel.text = "$\(price)"
//            } else {
//                priceLabel.text = ""
//            }
            
            if let imageName = app?.imageName {
                ProductImage.image = UIImage(named: imageName)
            }
            
        }
    }

    
}
