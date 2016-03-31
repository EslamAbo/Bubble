//
//  WishListProduct.swift
//  Bubble
//
//  Created by killvak on 3/12/16.
//  Copyright © 2016 killvak. All rights reserved.
//

import UIKit

class WishListProduct: UIViewController {
    @IBOutlet weak var NameOfProduct: UILabel!
    @IBOutlet weak var TextViewForProduct: UITextView!

    @IBOutlet weak var ImageOfProduct: UIImageView!
    @IBOutlet weak var NameOfTheStore: UILabel!
    
    var Product : WishListItems? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.NameOfProduct.text = self.Product?.title
        self.NameOfTheStore.text = self.Product?.store
        self.ImageOfProduct.image = UIImage(data: (self.Product?.image)!)
        
    }
    
    
    
}
