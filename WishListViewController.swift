//
//  WishListViewController.swift
//  Bubble
//
//  Created by killvak on 3/12/16.
//  Copyright © 2016 killvak. All rights reserved.
//

import UIKit
import CoreData


class WishListViewController: UIViewController , UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet weak var OpenBarButton: UIBarButtonItem!

    
    
    var Products : [WishListItems] = []
    var SelectedProduct : WishListItems? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.TableView.dataSource = self
        self.TableView.delegate = self
//        MakeSampleProduct()
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let request = NSFetchRequest(entityName: "WishListItems")
        var results : [AnyObject]?
        do {
            results = try context.executeFetchRequest(request)
        } catch _ {
            
        }
        if results != nil {
            self.Products = results! as! [WishListItems]
        }
        
        if self.revealViewController() != nil {
            OpenBarButton.target = self.revealViewController()
            OpenBarButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let request = NSFetchRequest(entityName: "WishListItems")
        var results : [AnyObject]?
        do {
            results = try context.executeFetchRequest(request)
        } catch _ {
            
        }
        if results != nil {
            self.Products = results! as! [WishListItems]
        }
        self.TableView.reloadData()
        
    }
    
    
   func MakeSampleProduct(){
    
    let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    let product = NSEntityDescription.insertNewObjectForEntityForName("WishListItems", inManagedObjectContext: context) as! WishListItems
 product.title = "Ohh well"
    product.image = UIImageJPEGRepresentation(UIImage(named: "9")!, 1 )
    do {
        try context .save()
    } catch _ {
        
    }

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.Products.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let product = self.Products[indexPath.row]
        cell.textLabel!.text = product.title
        cell.imageView!.image = UIImage(data: product.image!)
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.SelectedProduct = self.Products[indexPath.row]
        self.performSegueWithIdentifier("ProductSelectedSegue", sender: self)
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //AddCostumeWish
        if segue.identifier == "AddCostumeWish" {
            
        }
        if segue.identifier == "ProductSelectedSegue" {
        let detailVC = segue.destinationViewController as! WishListProduct
        detailVC.Product = self.SelectedProduct
        }
    }


}

