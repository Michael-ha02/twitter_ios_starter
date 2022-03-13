//
//  LoginViewController.swift
//  Twitter
//
//  Created by Michael Ha on 3/6/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
        
    }
    
    
    
    // anytime user click on this button, execute the task
    @IBAction func loginButtonPress(_ sender: UIButton) {
        let myUrl = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: myUrl, success: {

            // every time the user login, we automatically create userLoggedIn variable and check it true or false, if true -> go to home
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            
            // if it success, we need to go to the next screen
            // transition
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { Error in
            print("Could not login")
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
