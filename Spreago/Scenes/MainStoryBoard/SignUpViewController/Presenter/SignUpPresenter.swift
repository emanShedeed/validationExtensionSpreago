//
//  SignUpPresenter.swift
//  Spreago
//
//  Created by eman shedeed on 6/29/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import Foundation
import Apollo
import ProgressHUD
protocol SignUpViewControllerProtcol :BaseProtocol{
    func sendPinCodeForRegisterSucess(message:String)
}
/// This is a presenter class created for handling MovesHomeVC Functions.
class SignUpPresenter{
    private weak var view : SignUpViewControllerProtcol?
    // private var userTasks:Results<Task>!
    //   var tasksArray:[Task]?
    init(view:SignUpViewControllerProtcol) {
        self.view=view
    }
    func sendPinCodeForRegister(email:String){
      view?.showProgress()
      let sendPinCodeForRegisterMutation=SendPinCodeForRegisterMutation(email: email)
      apollo.perform(mutation: sendPinCodeForRegisterMutation) { [weak self] result in
        self?.view?.hideProgress()
          switch result {
          case .success(let parameter):
              if let error=parameter.errors?.first?["debugMessage"] {
                  //print(error)
                  self?.view?.showError(error: error as! String)
              }
              else {
                if(parameter.data?.sendPinCodeForRegister.status?.check ?? false){
                     
                    DispatchQueue.main.async(){ self?.view?.sendPinCodeForRegisterSucess(message: parameter.data?.sendPinCodeForRegister.status?.message ?? "Code send.")
                      }
                    }
                else{
                    self?.view?.showToast(message: parameter.data?.sendPinCodeForRegister.status?.message ?? "Error sending verification code.")
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
