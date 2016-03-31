//
//  AddToWishList.swift
//  Bubble
//
//  Created by killvak on 3/14/16.
//  Copyright © 2016 killvak. All rights reserved.
//

import UIKit
import CoreData

class AddToWishList: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var NameOutLet: UITextField!

    @IBOutlet weak var ImageOutLet: UIImageView!
    @IBOutlet weak var ImageButtonOutLet: UIButton!
    @IBOutlet weak var StoreNameOutLet: UITextField!
    @IBOutlet weak var PriceOutLet: UITextField!
    
    var ImagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
     ImagePicker.delegate = self

    }
    
    
    @IBAction func SaveButton(sender: AnyObject) {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let product = NSEntityDescription.insertNewObjectForEntityForName("WishListItems", inManagedObjectContext: context) as! WishListItems
        product.title = NameOutLet.text
        product.store = StoreNameOutLet.text
        product.image = UIImagePNGRepresentation(self.ImageOutLet!.image!)
        do {
            try context .save()
        } catch _ {
            
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    @IBAction func SelectProductImage(sender: AnyObject) {
        /* //Camera
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            let cameraVC = UIImagePickerController()
            cameraVC.sourceType = UIImagePickerControllerSourceType.Camera
            cameraVC.delegate = self
            self.presentViewController(cameraVC, animated: true, completion: nil)
        }
        func  imagePickerController(picker:UIImagePickerController, didFinishPickingMediaWithInfo image:UIImage , editingInfo : [String : AnyObject]?){
            
            self.ImageOutLet.image = image
            picker.dismissViewControllerAnimated(true, completion: nil)
        }
        
        
        self.dismissViewControllerAnimated(true, completion: nil)*/
        
        ImagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(ImagePicker, animated: true, completion: nil)
        
//        ImagePicker.sourceType = UIImagePickerControllerSourceType.Camera
//        presentViewController(ImagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        self.ImageOutLet.hidden = false
        ImageButtonOutLet.hidden = true 
        self.ImageOutLet.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    /*
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        self.ImageOutLet.hidden = false
        self.ImageOutLet.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    */
}
