//
//  ResetPasswordVC+PresenterDelegate.swift
//  Spreago
//
//  Created by eman shedeed on 7/6/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import ProgressHUD
extension ResetPasswordViewController:ResetPasswordViewControllerProtcol{

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
    func sendPinCodeForResetPassword(message: String) {
          let emailConfirmationVC = self.storyboard?.instantiateViewController(withIdentifier: "EmailConfirmationViewController") as! EmailConfirmationViewController
              emailConfirmationVC.email=textFields[0].text!
//                    self.show(emailConfirmationVC, sender: self)
        emailConfirmationVC.email=textFields[0].text!
        emailConfirmationVC.isResetPassword = true
             self.navigationController?.pushViewController(emailConfirmationVC, animated: true)
    }
    

}
