//
//  HomePageView.swift
//  Bubble
//
//  Created by killvak on 3/16/16.
//  Copyright © 2016 killvak. All rights reserved.
//

import UIKit

class HomePageView: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate , UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var ShopTableView: UITableView!
    //Vars
    //Test Zone

    @IBOutlet weak var OpenBarButton: UIBarButtonItem!
    //
    
    var navBar:UINavigationBar=UINavigationBar()
    
    let collectionViewAIdentifier = "CatCell"
    let collectionViewBIdentifier = "MainCell"
    var test = false
    var Categories = ["Toys","Gifts","Rosses","D","E","F","G"]
    var Image = ["3","3","3","3","Voyage Air Guitar on Shark Tank Show","00dd7295-7ef1-4028-9dfa-952c30c8b1be","prod_81_1"]
    var Banners  = ["shop1","shop2","shop3","shop4","shop5","shop6","shop7"]

    var ShopInfo = ShopDetails()

    var TEst2 = ["3","3","3","3","Voyage Air Guitar on Shark Tank Show","00dd7295-7ef1-4028-9dfa-952c30c8b1be","prod_81_1"]
    var Shops  = [UIImage(named: "shop1"),UIImage(named: "shop2"),UIImage(named: "shop3"),UIImage(named: "shop4"),UIImage(named: "shop5"),UIImage(named: "shop6"),UIImage(named: "shop7")]

    
    var shopsName = ["El Talawy","Kitty","Gift4U","Ass You See","Hot Shoot","Painter Shop","Draw Shop"]
    var shopType = ["Gifts & Toys","Banner Shop","Any Shit","**** ***","Police Department","Painting 24/7","Ohh Shit"]
    
    //OutLets
    @IBOutlet weak var ShopsOrGiftsOutLet: UISegmentedControl!
    @IBOutlet weak var CatgoriesCollectionView: UICollectionView!
    @IBOutlet weak var SeeAllShopsOutlet: UIButton!
    @IBOutlet weak var MainCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        // Initialize the collection views, set the desired frames
        CatgoriesCollectionView.delegate = self
        MainCollectionView.delegate = self
        
        ShopTableView.delegate = self
        CatgoriesCollectionView.dataSource = self
        MainCollectionView.dataSource = self
        ShopTableView.dataSource = self
        
        //Test Ground
       
        
        //
        //SideMenu 
        
//        OpenBarButton.target  = self.revealViewController()
//        OpenBarButton.action = Selector("revealToggle:")
        
        
        
        if self.revealViewController() != nil {
            OpenBarButton.target = self.revealViewController()
            OpenBarButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        //
        if (self.ShopsOrGiftsOutLet == 0){
            self.MainCollectionView.hidden = false
            self.ShopTableView.hidden = true
             TEst2 = ["3","3","3","3","Voyage Air Guitar on Shark Tank Show","00dd7295-7ef1-4028-9dfa-952c30c8b1be","prod_81_1"]

        }
        if (self.ShopsOrGiftsOutLet == 1){
            self.MainCollectionView.hidden = true
            self.ShopTableView.hidden = false
            TEst2 = ["logo1","logo2","logo3","logo4","logo5","logo6","logo7"]
        }
        //Test Zone
     
        navigationController?.hidesBarsOnSwipe = true

        //
        self.view.addSubview(CatgoriesCollectionView)
        self.view.addSubview(MainCollectionView)
    }
    
  //Test Zone
    
    //

    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.CatgoriesCollectionView {
            return Categories.count // Replace with count of your data for collectionViewA
        }
        
        return Image.count // Replace with count of your data for collectionViewB
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if collectionView == self.CatgoriesCollectionView {
            let cellA = collectionView.dequeueReusableCellWithReuseIdentifier(collectionViewAIdentifier, forIndexPath: indexPath ) as! HomePageCategoriesCell
            cellA.layer.cornerRadius = 20
            if self.CatgoriesCollectionView.hidden == true {
                print("True")
            }
            cellA.CategoriesView.layer.cornerRadius = 20
            cellA.CategoriesView.layer.borderWidth = 5.0
            cellA.CategoriesView.layer.borderColor = UIColor(red: 57/255, green: 195/255, blue: 255/255, alpha: 1).CGColor
            
            cellA.NameOfCategoriesOutLet.text = self.Categories[indexPath.row]
            
            
            // Set up cell
            return cellA
        }
            
        else {
            let cellB = MainCollectionView.dequeueReusableCellWithReuseIdentifier(collectionViewBIdentifier , forIndexPath: indexPath ) as! HomePageProductsCell
//            if test {
//                
//            }else {
//                
//            }
                        cellB.ProductImage.image = UIImage(named: TEst2[indexPath.row] /*as! String*/)

            // ...Set up cell
            
            return cellB
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if collectionView == self.CatgoriesCollectionView {

            print("SUB")
            let cellB = MainCollectionView.dequeueReusableCellWithReuseIdentifier(collectionViewBIdentifier , forIndexPath: indexPath ) as! HomePageProductsCell
            print(indexPath.row)
            switch indexPath.row {
            case 0 :
                print("A")
                TEst2 = ["3","3","6","6","Voyage Air Guitar on Shark Tank Show","00dd7295-7ef1-4028-9dfa-952c30c8b1be","prod_81_1"]
            case 1 :
                TEst2 = ["6","6","8","8","Voyage Air Guitar on Shark Tank Show","00dd7295-7ef1-4028-9dfa-952c30c8b1be","prod_81_1"]
            case 2 :
                TEst2 = ["8","8","3","3","Voyage Air Guitar on Shark Tank Show","00dd7295-7ef1-4028-9dfa-952c30c8b1be","prod_81_1"]
            case 3 :
                TEst2 = ["9","9","6","6","Voyage Air Guitar on Shark Tank Show","00dd7295-7ef1-4028-9dfa-952c30c8b1be","prod_81_1"]
            case 4 :
                TEst2 = ["Voyage Air Guitar on Shark Tank Show","Voyage Air Guitar on Shark Tank Show","6","6","Voyage Air Guitar on Shark Tank Show","00dd7295-7ef1-4028-9dfa-952c30c8b1be","prod_81_1"]
            case 5 :
                TEst2 = ["Voyage Air Guitar on Shark Tank Show","Voyage Air Guitar on Shark Tank Show","6","6","Voyage Air Guitar on Shark Tank Show","00dd7295-7ef1-4028-9dfa-952c30c8b1be","prod_81_1"]
            case 6 :
                print("g")
                 TEst2 = ["00dd7295-7ef1-4028-9dfa-952c30c8b1be","00dd7295-7ef1-4028-9dfa-952c30c8b1be","6","6","Voyage Air Guitar on Shark Tank Show","00dd7295-7ef1-4028-9dfa-952c30c8b1be","prod_81_1"]
            default :
                print("Invalid Category")
            }
            test = true
            MainCollectionView.reloadData()
        }else    {
            print("NotWorking")
            self.performSegueWithIdentifier("ProductCell", sender: self)
            
        }
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Shops.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : ShopListCell = ShopTableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ShopListCell
        cell.ImageOfBanner.image =  UIImage(named: Banners[indexPath.row] )
        cell.NameOfTheShop.text = shopsName[indexPath.row]
        cell.ShopType.text = shopType[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        ShopInfo.ShopType = self.shopType[indexPath.row]
        ShopInfo.ShopBanner = Banners[indexPath.row]
        ShopInfo.ShopName = shopsName[indexPath.row]
        self.performSegueWithIdentifier("ShopInfo", sender: self)
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ProductCell" {
            let indexPaths = self.MainCollectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
                let detailVC = segue.destinationViewController as! ProductPage
            
            detailVC.ImageOfShop = self.Shops[indexPath.row]!
            detailVC.ImageOfProduct = UIImage(named: TEst2[indexPath.row])!
        }
        if segue.identifier == "ShopInfo" {
            let VC = segue.destinationViewController as! ShopInfoViewController
            VC.test.ShopType = ShopInfo.ShopType
            VC.test.ShopName = ShopInfo.ShopName
            VC.test.ShopBanner = ShopInfo.ShopBanner
            
        }
    }
    //SegmentAction
    @IBAction func ShopsOrGiftsAction(sender: AnyObject) {
       
        if (self.ShopsOrGiftsOutLet.selectedSegmentIndex == 0){

            self.MainCollectionView.hidden = false
            self.ShopTableView.hidden = true
            
            TEst2 = ["3","3","3","3","Voyage Air Guitar on Shark Tank Show","00dd7295-7ef1-4028-9dfa-952c30c8b1be","prod_81_1"]
            self.CatgoriesCollectionView.hidden = false
            self.SeeAllShopsOutlet.hidden = true
            test = false
        }
        if (self.ShopsOrGiftsOutLet.selectedSegmentIndex == 1){
            
            self.MainCollectionView.hidden = true
            self.ShopTableView.hidden = false

            TEst2 = ["logo1","logo2","logo3","logo4","logo5","logo6","logo7"]
            self.CatgoriesCollectionView.hidden = true
            self.SeeAllShopsOutlet.hidden = false
            test = true

        }
        MainCollectionView.reloadData()
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if targetContentOffset.memory.y < scrollView.contentOffset.y {
            print("Going up!")
        } else {
            print("Going down!")
            
         
            
            
     //            navigationController?.hidesBarsOnSwipe = true
//            prefersStatusBarHidden()
//            preferredStatusBarUpdateAnimation()
            
        }
    }
    @IBAction func SeeAllShopsAction(sender: AnyObject) {
    }
    
}
