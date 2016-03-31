//
//  ZoomedProductCV.swift
//  Bubble
//
//  Created by killvak on 3/29/16.
//  Copyright © 2016 killvak. All rights reserved.
//

import UIKit

class ZoomedProductCV: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate {
    
    @IBOutlet weak var ZoomedCollectionViewOutLet: UICollectionView!
    
    var Image = ["3","prod_81_1"]
    
    var test = NSString()
var app : AppCategory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(test)
        self.ZoomedCollectionViewOutLet.delegate = self
        self.ZoomedCollectionViewOutLet.dataSource = self
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        if let count =  app?.apps?.count{
//            return count
//        }
        
        return Image.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = ZoomedCollectionViewOutLet.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ZoomedProductCollectionViewCell
        cell.ProductImage.image = UIImage(named: Image[indexPath.row] /*as! String*/)
//        cell.app = app?.apps?[indexPath.item]
        return cell
        
    }

}
