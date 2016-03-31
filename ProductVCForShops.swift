//
//  ProductVCForShops.swift
//  Bubble
//
//  Created by killvak on 3/29/16.
//  Copyright © 2016 killvak. All rights reserved.
//

import UIKit

class ProductVCForShops: UIViewController {

    var app : App? {
        didSet{
            navigationItem.title = app?.name
          
        }
    }
    @IBOutlet weak var ProductImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = app?.imageName {
            ProductImage.image = UIImage(named: image)
        }
    }
}
