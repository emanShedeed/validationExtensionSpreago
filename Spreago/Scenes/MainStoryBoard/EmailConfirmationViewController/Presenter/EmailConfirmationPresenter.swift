//
//  EmailConfirmationPresenter.swift
//  Spreago
//
//  Created by eman shedeed on 7/5/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import Foundation
import Apollo
import ProgressHUD
protocol EmailConfirmationViewControllerProtcol :BaseProtocol{
     func verifyPinCodeSucess()
}
/// This is a presenter class created for handling MovesHomeVC Functions.
class EmailConfirmationPresenter{
    private weak var view : EmailConfirmationViewControllerProtcol?
    // private var userTasks:Results<Task>!
    //   var tasksArray:[Task]?
    init(view:EmailConfirmationViewControllerProtcol) {
        self.view=view
    }
    func verifyPinCode(email:String,pinCode:String){
      view?.showProgress()
        let verifyPinCodeMutation=VerifyPinCodeMutation(email: email, pin_code: pinCode)
      apollo.perform(mutation: verifyPinCodeMutation) { [weak self] result in
        self?.view?.hideProgress()
          switch result {
          case .success(let parameter):
              if let error=parameter.errors?.first?["debugMessage"] {
                  //print(error)
                  self?.view?.showError(error: error as! String)
              }
              else {
                if(parameter.data?.verifyPinCode.status?.check ?? false){
                     
                    DispatchQueue.main.async(){ self?.view?.verifyPinCodeSucess()
                      }
                    }
                else{
                    self?.view?.showToast(message: parameter.data?.verifyPinCode.status?.message ?? "Invalid code.")
                }
              }
          case .failure(let error):
              if(!Helper.isConnectedToNetwork()){
                  self?.view?.showError(error: "Check your internet connection and try again." )
              }else{
                  self?.view?.showError(error: error.localizedDescription )
              }
          }
          
      }
  }
}
