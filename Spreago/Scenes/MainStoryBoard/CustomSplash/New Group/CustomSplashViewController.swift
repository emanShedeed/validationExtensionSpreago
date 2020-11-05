//
//  CustomSplashViewController.swift
//  Spreago
//
//  Created by eman shedeed on 6/29/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import UIKit

class CustomSplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let user = Helper.getUserDetails()
        Thread.sleep(forTimeInterval: 1.5)
        if user.count != 0 {
         
            if let userType = user["userType"] as? Int{
                if userType == 1{
                    if let employerHomeVC = UIStoryboard.employerHome.instantiateInitialViewController(){
                        self.present(employerHomeVC, animated: true, completion:nil)
                    }
                }else{
                    if let applicantrHomeVC = UIStoryboard.applicantHome.instantiateInitialViewController(){
                        self.present(applicantrHomeVC, animated: true, completion:nil)
                    }
                }
            }
            
            
            
        } else{
//            let introductionvc = self.storyboard?.instantiateViewController(withIdentifier: "IntroductionViewController") as! IntroductionViewController
//            self.show(introductionvc, sender: self)
            let viewController = UIStoryboard.main.instantiateViewController(withIdentifier: "navigationController") as! UINavigationController
                                 
            self.present(viewController, animated: true, completion:nil)
                
        }  
    }
}
