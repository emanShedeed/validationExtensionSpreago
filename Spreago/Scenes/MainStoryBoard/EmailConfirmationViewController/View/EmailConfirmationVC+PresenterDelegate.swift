//
//  EmailConfirmationVC+PresenterDelegate.swift
//  Spreago
//
//  Created by eman shedeed on 7/5/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import ProgressHUD
extension EmailConfirmationViewController:EmailConfirmationViewControllerProtcol{
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
    
    func verifyPinCodeSucess() {
        if(isResetPassword){
            let changePasswordVC = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordViewController") as! ChangePasswordViewController
            //                  self.show(ChangePasswordVC, sender: self)
            changePasswordVC.email=email
            changePasswordVC.pinCode=confirmationCode
            self.navigationController?.pushViewController(changePasswordVC, animated: true)
        }else{
            let registerVC = self.storyboard?.instantiateViewController(withIdentifier: "RegistrationFormViewController") as! RegistrationFormViewController
            registerVC.email = email
            registerVC.pincode = confirmationCode
            self.navigationController?.pushViewController(registerVC, animated: true)
            //        self.show(registerVC, sender: self)
        }
    }
    
    
}
extension EmailConfirmationViewController:SignUpViewControllerProtcol{
    func sendPinCodeForRegisterSucess(message: String) {
        Helper.showToast(message: message)
    }
    
}
