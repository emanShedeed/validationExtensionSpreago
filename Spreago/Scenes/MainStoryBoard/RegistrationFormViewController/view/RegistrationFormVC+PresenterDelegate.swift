//
//  RegistrationFormVC+PresenterDelegate.swift
//  Spreago
//
//  Created by eman shedeed on 7/7/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import ProgressHUD
extension RegistrationFormViewController:RegistrationFormViewControllerProtcol{
    
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
    
    func fetchCountriesSucess(info: [CountryInfo]) {
        countriesInfoArray = info
        info.forEach { (country) in
            countriesArray.append((country.id,country.name))
        }
        countryAutoCombleteTV.reloadData()
    }
    func registerSuccess(auth: [String : Any]) {
        DispatchQueue.main.async(){
            Helper.saveUserDetails(userInfo: auth)
        }
        if let userType = auth["userType"] as? Int{
            if(userType == 1){
                let employerHomeVC = UIStoryboard.employerHome.instantiateInitialViewController()
                self.navigationController?.pushViewController(employerHomeVC!, animated: true)
            }else{
                let applicantrHomeVC = UIStoryboard.applicantHome.instantiateInitialViewController()
                self.navigationController?.pushViewController(applicantrHomeVC!, animated: true)
            }
        }
    }
    
    
}
