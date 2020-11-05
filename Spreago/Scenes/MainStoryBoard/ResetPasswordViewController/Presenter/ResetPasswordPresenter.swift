//
//  ResetPasswordPresenter.swift
//  Spreago
//
//  Created by eman shedeed on 7/6/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import Foundation
import Apollo
import ProgressHUD
protocol ResetPasswordViewControllerProtcol :BaseProtocol{
    func sendPinCodeForResetPassword(message:String)
}
/// This is a presenter class created for handling MovesHomeVC Functions.
class ResetPasswordPresenter{
    private weak var view : ResetPasswordViewControllerProtcol?
    // private var userTasks:Results<Task>!
    //   var tasksArray:[Task]?
    init(view:ResetPasswordViewControllerProtcol) {
        self.view=view
    }
    func   sendPinCodeForpasswordreset(email:String){
      view?.showProgress()
      let sendPinCodeForpasswordresetsMutation=SendPinCodeForpasswordresetsMutation(email: email)
      apollo.perform(mutation: sendPinCodeForpasswordresetsMutation) { [weak self] result in
        self?.view?.hideProgress()
          switch result {
          case .success(let parameter):
              if let error=parameter.errors?.first?["debugMessage"] {
                  //print(error)
                  self?.view?.showError(error: error as! String)
              }
              else {
                if(parameter.data?.sendPinCodeForpasswordresets.status?.check ?? false){
                     
                    DispatchQueue.main.async(){ self?.view?.sendPinCodeForResetPassword(message: parameter.data?.sendPinCodeForpasswordresets.status?.message ?? "Code send.")
                      }
                    }
                else{
                    self?.view?.showToast(message: parameter.data?.sendPinCodeForpasswordresets.status?.message ?? "Error sending verification code.")
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
