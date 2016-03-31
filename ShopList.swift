//
//  ShopList.swift
//  Bubble
//
//  Created by killvak on 3/17/16.
//  Copyright © 2016 killvak. All rights reserved.
//

import UIKit

class ShopList: UIViewController , UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var OpenBarButton: UIBarButtonItem!

    var SelectedShop :NSString = ""
    var ShopInfo = ShopDetails()
    //vars
/*
    var Shops  = [UIImage(named: "shop1"),UIImage(named: "shop2"),UIImage(named: "shop3"),UIImage(named: "shop4"),UIImage(named: "shop5"),UIImage(named: "shop6"),UIImage(named: "shop7")]
    */
    var Shops  = ["shop1","shop2","shop3","shop4","shop5","shop6","shop7","shop1","shop2","shop3","shop4","shop5","shop6","shop7","shop1","shop2","shop3","shop4","shop5","shop6","shop7"]

    var shopsName = ["El Talawy","Kitty","Gift4U","Ass You See","Hot Shoot","Painter Shop","Draw Shop"]
    var shopType = ["Gifts & Toys","Banner Shop","Any Shit","**** ***","Police Department","Painting 24/7","Ohh Shit"]
    
    override func prefersStatusBarHidden() -> Bool {
        return navigationController?.navigationBarHidden == true
    }
    
    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        return UIStatusBarAnimation.Fade
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TableView.dataSource = self
        self.TableView.delegate = self
        if self.revealViewController() != nil {
            OpenBarButton.target = self.revealViewController()
            OpenBarButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Shops.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : ShopListCell = TableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ShopListCell
        cell.ImageOfBanner.image =  UIImage(named: Shops[indexPath.row] )
//        cell.NameOfTheShop.text = shopsName[indexPath.row]
//        cell.ShopType.text = shopType[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        ShopInfo.ShopType = self.shopType[indexPath.row]
        ShopInfo.ShopBanner = Shops[indexPath.row]
//        ShopInfo.ShopName = shopsName[indexPath.row]
        self.performSegueWithIdentifier("ShopInfo", sender: self)
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if targetContentOffset.memory.y < scrollView.contentOffset.y {
            print("Going up!")
        } else {
            print("Going down!")
            navigationController?.hidesBarsOnSwipe = true
            prefersStatusBarHidden()
            preferredStatusBarUpdateAnimation()

        }
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row+1 == Shops.count {
            print("came to last row")
            print("Sub\(indexPath.row)")
            print("Sub\(indexPath.row+1)")

        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShopInfo" {
            let VC = segue.destinationViewController as! ShopInfoViewController
            VC.test.ShopType = ShopInfo.ShopType
            VC.test.ShopName = ShopInfo.ShopName
            VC.test.ShopBanner = ShopInfo.ShopBanner

        }
    }
    //ShopInfo
}
