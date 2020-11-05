//
//  LoginWithEmailVC+PresenterDelegate.swift
//  Spreago
//
//  Created by eman shedeed on 7/1/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import ProgressHUD
extension LoginWithEmailAddressViewController:LoginWithEmailAddressViewControllerProtcol{
    func showError(error: String) {
        Helper.showAlert(title: "", message: error, VC: self)
    }
    
    func showToast(message: String) {
        Helper.showToast(message: message)
    }
    
    func showProgress() {
        ProgressHUD.colorBackground((UIColor.blue))
        ProgressHUD.colorSpinner(UIColor(rgb: 0xDB9126))
        ProgressHUD.colorStatus(UIColor.blue)
        ProgressHUD.show()
        self.view.isUserInteractionEnabled = false
    }
    
    func hideProgress() {
        ProgressHUD.dismiss()
        self.view.isUserInteractionEnabled = true
    }
    
    func loginSuccess(auth: [String : Any]) {
        let isRememberMeChecked = UserDefaults.standard.value(forKey: Constants.Defaults.rememberMe) as! Bool
        if(isRememberMeChecked){
            DispatchQueue.main.async(){
                Helper.saveUserDetails(userInfo: auth)
            }
                 if let userType = auth["userType"] as? Int{
                     if userType == 1{
                         let employerHomeVC = UIStoryboard.employerHome.instantiateInitialViewController()
                         self.navigationController?.pushViewController(employerHomeVC!, animated: true)
                     }else{
                         let applicantrHomeVC = UIStoryboard.applicantHome.instantiateInitialViewController()
                         self.navigationController?.pushViewController(applicantrHomeVC!, animated: true)
                     }
                 }
        }
    }
    
}
extension LoginWithEmailAddressViewController:IntroductionViewControllerProtcol{
    func showRegistrationForm() {
        let registerVC = self.storyboard?.instantiateViewController(withIdentifier: "RegistrationFormViewController") as! RegistrationFormViewController
        registerVC.token = googleToken
        registerVC.provider = socialProvider
        registerVC.userName = name
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    func loginWithSocialSuccess(auth: [String : Any]) {
        DispatchQueue.main.async(){
            Helper.saveUserDetails(userInfo: auth)
            //                   self.performSegue(withIdentifier: "goToMovesHomeVC", sender: self)
        }
        if let userType = auth["userType"] as? Int{
            if userType == 1{
                let employerHomeVC = UIStoryboard.employerHome.instantiateInitialViewController()
                self.navigationController?.pushViewController(employerHomeVC!, animated: true)
            }else{
                let applicantrHomeVC = UIStoryboard.applicantHome.instantiateInitialViewController()
                self.navigationController?.pushViewController(applicantrHomeVC!, animated: true)
            }
        }
    }
    
}
