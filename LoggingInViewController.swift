//
//  LoggingInViewController.swift
//  Bubble
//
//  Created by killvak on 3/23/16.
//  Copyright © 2016 killvak. All rights reserved.
//

import UIKit
import Google
class LoggingInViewController: UIViewController , FBSDKLoginButtonDelegate , GIDSignInUIDelegate , GIDSignInDelegate{
//LoggedIn
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    let loginButton : FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loginButton)
        loginButton.center = view.center
        loginButton.delegate = self
        
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self

        let signInButton = GIDSignInButton(frame: CGRectMake(0,0,100,50))
        signInButton.center = view.center
        
        view.addSubview(signInButton)
        // Uncomment to automatically sign in the user.
//        GIDSignIn.sharedInstance().signInSilently()

        if let tempUser = GIDSignIn.sharedInstance().currentUser {
          print("Say hi Google")
            fetchProfile()
        }

       
    
        if let token = FBSDKAccessToken.currentAccessToken(){
            fetchProfile()
        }
    }
 

    
    
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
      print("didCompleteWithResult")
        self.performSegueWithIdentifier("LoggedIn", sender: self)
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
        print("loginButtonDidLogOut")
  
    }
    
    func loginButtonWillLogin(loginButton: FBSDKLoginButton!) -> Bool {
        print("loginButtonWillLogin")

        return true
    }
    
    
    func fetchProfile() {
        print("fetchProfile")
        let parameters = [ "fields":"email, first_name,last_name, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).startWithCompletionHandler { (connection, result, error) -> Void in
            
            if error != nil {
                print(error )
                return
            }
            
            
            if let email = result["email"] as? String {
                print(email)
            }
            
            if let picture = result["picture"] as? NSDictionary , data = picture["data"] as? NSDictionary , url = data["url"] as? String {
                print(url)
            }
//            print(result)
//            self.performSegueWithIdentifier("LoggedIn", sender: self)

        }
        
    }
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
        
     
        if (error == nil) {
            print(user.profile.email)
            myActivityIndicator.startAnimating()
            self.performSegueWithIdentifier("LoggedIn", sender: self)
            print("didSignInForUser")
            // ...
        } else {
            print("\(error.localizedDescription)")
        }


    }
    // Implement these methods only if the GIDSignInUIDelegate is not a subclass of
    // UIViewController.
    
    // Stop the UIActivityIndicatorView animation that was started when the user
    // pressed the Sign In button
    func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
        myActivityIndicator.stopAnimating()
        print("signInWillDispatch")

    }
    
    // Present a view that prompts the user to sign in with Google
    func signIn(signIn: GIDSignIn!,
        presentViewController viewController: UIViewController!) {
            self.presentViewController(viewController, animated: true, completion: nil)
            print("presentViewController")

    }
    
    // Dismiss the "Sign in with Google" view
    func signIn(signIn: GIDSignIn!,
        dismissViewController viewController: UIViewController!) {
            self.dismissViewControllerAnimated(true, completion: nil)
            print("dismissViewController")

    }
    
    
}
