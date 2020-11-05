//
//  ChangePasswordVC+PresenterDelegate.swift
//  Spreago
//
//  Created by eman shedeed on 7/6/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import ProgressHUD

extension ChangePasswordViewController:ChangePasswordViewControllerProtcol{
    
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
    
    func resetPasswordSucess(auth: [String : Any]) {
        let isRememberMeChecked = UserDefaults.standard.value(forKey: Constants.Defaults.rememberMe) as? Bool
        if(isRememberMeChecked ?? true){
            DispatchQueue.main.async(){
                Helper.saveUserDetails(userInfo: auth)
            }
             let LoginWithEmailAddressVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginWithEmailAddressViewController") as! LoginWithEmailAddressViewController
                 self.present(LoginWithEmailAddressVC, animated: false)
        }
    }
    
}
