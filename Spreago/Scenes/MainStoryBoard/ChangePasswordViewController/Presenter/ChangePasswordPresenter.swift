//
//  ChangePasswordPresenter.swift
//  Spreago
//
//  Created by eman shedeed on 7/6/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import Foundation
import Apollo
import ProgressHUD
protocol ChangePasswordViewControllerProtcol :BaseProtocol{
    func resetPasswordSucess(auth:[String:Any])
}
/// This is a presenter class created for handling MovesHomeVC Functions.
class ChangePasswordPresenter{
    private weak var view : ChangePasswordViewControllerProtcol?
    // private var userTasks:Results<Task>!
    //   var tasksArray:[Task]?
    init(view:ChangePasswordViewControllerProtcol) {
        self.view=view
    }
    func   resetpassword(forgotPasswordInput:forgotPasswordinput,verifyPinCodeInput:verifyPinCodeInput){
      view?.showProgress()
      let sendPinCodeForpasswordresetsMutation=PasswordresetsMutation(forgotPasswordInput: forgotPasswordInput, verifyPinCodeInput: verifyPinCodeInput)
      apollo.perform(mutation: sendPinCodeForpasswordresetsMutation) { [weak self] result in
        self?.view?.hideProgress()
         switch result {
                    case .success(let parameter):
                        if let error=parameter.errors?.first?["debugMessage"] {
                            //print(error)
                            self?.view?.showError(error: error as! String)
                        }
                        else {
                            if(parameter.data?.passwordresets.status?.check ?? false){
                               if let user = parameter.data?.passwordresets.user, let breaer = parameter.data?.passwordresets.bearerTokenResponse{
                              let userInfo=["userID":user.id ,
                                            "userName":user.name,
                                            "userEmail":user.email,
                                             "userType":user.type.id, "accessToken":breaer.accessToken
                                  ] as [String : Any]
                                  DispatchQueue.main.async(){ self?.view?.resetPasswordSucess(auth: userInfo )
                                }
                              }
                          }else{
                              self?.view?.showToast(message: parameter.data?.passwordresets.status?.message ?? "the user is not found")
                          }
          //                  else{
          //                      self?.view?.verifyAccount()
          //                  }
                            //self?.view?.showError(error: (parameter.data?.register.message) ?? " ")
                            // print(parameter.data?.register.message)
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
