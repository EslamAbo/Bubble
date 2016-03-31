//
//  ProductPage.swift
//  Bubble
//
//  Created by killvak on 3/16/16.
//  Copyright © 2016 killvak. All rights reserved.
//

import UIKit

class ProductPage: UIViewController {
    @IBOutlet weak var FavButtonOutlet: UIButton!

    @IBOutlet weak var ProductImageOutLet: UIImageView!
    @IBOutlet weak var ShopImageOutlet: UIImageView!
    @IBOutlet weak var CartOutLet: UIButton!
    @IBOutlet weak var WishListOutlet: UIButton!
    
     var ImageOfProduct = UIImage()
    var ImageOfShop = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ProductImageOutLet.image = ImageOfProduct
        self.ShopImageOutlet.image = ImageOfShop
    }
    
    
    @IBAction func FavButtonAction(sender: AnyObject) {
    }
   
    @IBAction func WishButtonAction(sender: AnyObject) {
    }
    
    @IBAction func AddToCartAction(sender: AnyObject) {
    }
    
}
