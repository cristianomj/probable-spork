//
//  LoginViewController.swift
//  Probable Spork
//
//  Created by Cristiano Miranda on 2/28/16.
//  Copyright © 2016 Cristiano Miranda. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OnLoginButton(sender: AnyObject) {
        let twitterClient = BDBOAuth1SessionManager(baseURL: NSURL(string: "https://api.twitter.com")!, consumerKey: "vWd2bPiiPjqwZPPjfrsM37cP8", consumerSecret: "qtoYROZWKfYKsq7bUzB6Cm1HSiPN4cLfBLKWDf7jKOU1hksDrv")
        
        twitterClient.deauthorize()
        twitterClient.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "probablespork://oauth"), scope: nil, success: { (requestToken: BDBOAuth1Credential!) -> Void in
            print("I got a token!")
            
            let url = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")!
            UIApplication.sharedApplication().openURL(url)
            
            }) { (error: NSError!) -> Void in
                print("error: \(error.localizedDescription)")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
