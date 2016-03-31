//
//  ShopInfoViewController.swift
//  Bubble
//
//  Created by killvak on 3/21/16.
//  Copyright © 2016 killvak. All rights reserved.
//

import UIKit

class ShopInfoViewController: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    private let cellId = "cellId"
    var appCategory : AppCategory?
    var appCategories : [AppCategory]?
    @IBOutlet weak var HorizintalScroller1st: UICollectionView!
    @IBOutlet weak var ShopBannerOutLet: UIImageView!

    var test = ShopDetails()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.HorizintalScroller1st.dataSource   = self
        self.HorizintalScroller1st.delegate = self
//        self.HorizintalScroller1st?.registerClass(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        
        appCategories = AppCategory.sampleAppCat()
        ShopBannerOutLet.image = UIImage(named: test.ShopBanner as String)
        // Do any additional setup after loading the view.
        print("\(test.ShopName)\(test.ShopBanner),\(test.ShopType)")
        
     
    }
    

    
    
    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    if "zoom" == segue.identifier {
    let controller = segue.destinationViewController as! ZoomedProductCV
    controller.test = "hi"
    
    if let button = sender as? UIButton {
    // ... The UIButton is the sender
    //                controller.app =  appCategory?.apps?[button.tag]
    print("The Button Tag IS %d",button.tag)
    }
    }
    
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
*/
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! CategoryCell
        
        cell.appCategory = appCategories?[indexPath.item]
        cell.featureAppController = self
        //Test :
        cell.ZoomButtonOutLet.addTarget(self, action: "buttonClicked", forControlEvents: UIControlEvents.TouchUpInside)
//       var TestButtonTag = ("%d%d",indexPath.section,indexPath.row)
        //
        cell.ZoomButtonOutLet.tag = indexPath.row
        print("Button Tag = %d",cell.ZoomButtonOutLet.tag)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = appCategories?.count {
            return count
        }
        return 0
    }
    
    //Test :
    func buttonClicked(sender: UIButton?) {
        let tag = sender!.tag
        
        let destinationViewController = storyboard?.instantiateViewControllerWithIdentifier("ZoomedProductCV") as! ZoomedProductCV
        
        
                // ... The UIButton is the sender
                destinationViewController.app = appCategory?.apps![tag]
        
            navigationController?.pushViewController(destinationViewController, animated: true)
    }
 //
    
    func showAppDetailForApp(app:App) {
        
        print("Main")
        let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ProductVCForShops") as! ProductVCForShops
        secondViewController.app = app 
        self.navigationController?.pushViewController(secondViewController, animated: true)
        
    }
 
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(view.frame.width , 230)

    }
    
    //Test : 
    
    //
    
}
















