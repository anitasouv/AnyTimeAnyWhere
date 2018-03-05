//
//  LoginViewController.swift
//  finalProject
//
//  Created by Anita Souv on 3/4/18.
//  Copyright © 2018 Anita Souv. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import FBSDKLoginKit

class LoginViewController: UIViewController {

    @IBOutlet weak var facebookLoginView: UIView!
    @IBOutlet weak var connectionBtn: UIButton!
    @IBAction func connect(_ sender: Any) {
        let connection = GraphRequestConnection()
        connection.add(MyProfileRequest()) { response, result in
            switch result {
            case .success(let response):
                print("Custom Graph Request Succeeded: \(response)")
                print("My facebook id is \(response.id ?? "ErrorId")")
                print("My name is \(response.name ?? "ErrorName")")
            case .failed(let error):
                print("Custom Graph Request Failed: \(error)")
            }
        }
        connection.start()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //creating button
        let loginButton = LoginButton(readPermissions: [ .publicProfile, .userEvents ])
        loginButton.center = view.center
        
        //adding it to view
        view.addSubview(loginButton)
        
        //if the user is already logged in
        if let accessToken = FBSDKAccessToken.current(){
            getFBUserData()
        }

        // For more complex open graph stories, use `FBSDKShareAPI`
        // with `FBSDKShareOpenGraphContent`
        
        /* make the API call */
        
//        let request:FBSDKGraphRequest  = [[FBSDKGraphRequest, alloc],
//                                     initWithGraphPath:@"/{event-id}",
//                                     parameters:params,
//                                     HTTPMethod:@"GET"];
//        [request, startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
//            id result,
//            NSError *error) {
//            // Handle the result
//            }];
//        if ([FBSDKAccessToken currentAccessToken]) {
//            [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
//                startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
//                if (!error) {
//                NSLog(@"fetched user:%@", result);
//                }
//                }];
//        }
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //when login button clicked
    @objc func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [ .publicProfile ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                self.getFBUserData()
            }
        }
    }
    
    var dict : [String : AnyObject]!
    //function is fetching the user data
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    print(result!)
                    print(self.dict)
                }
            })
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
