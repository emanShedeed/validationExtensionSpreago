//
//  LoginPresenter.swift
//  Spreago
//
//  Created by eman shedeed on 6/29/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import Foundation
import Apollo
import ProgressHUD
protocol LoginWithEmailAddressViewControllerProtcol :BaseProtocol{
     func loginSuccess(auth:[String:Any])
}
/// This is a presenter class created for handling MovesHomeVC Functions.
class LoginWithEmailAddressPresenter{
    private weak var view : LoginWithEmailAddressViewControllerProtcol?
    // private var userTasks:Results<Task>!
    //   var tasksArray:[Task]?
    init(view:LoginWithEmailAddressViewControllerProtcol) {
        self.view=view
    }
    func login(logindata:attempt){
      view?.showProgress()
      let loginMutation=LoginMutation(attempt: logindata)
      apollo.perform(mutation: loginMutation) { [weak self] result in
        self?.view?.hideProgress()
          switch result {
          case .success(let parameter):
              if let error=parameter.errors?.first?["debugMessage"] {
                  //print(error)
                  self?.view?.showError(error: error as! String)
              }
              else {
                if(parameter.data?.login.status?.check ?? false){
                     if let user = parameter.data?.login.user, let breaer = parameter.data?.login.bearerTokenResponse{
                    let userInfo=["userID":user.id ,
                                  "userName":user.name,
                                  "userEmail":user.email,
                                  "userType":user.type.id, "accessToken":breaer.accessToken
                        ] as [String : Any]
                        DispatchQueue.main.async(){ self?.view?.loginSuccess(auth: userInfo )
                      }
                    }
                }else{
                    self?.view?.showToast(message: parameter.data?.login.status?.message ?? "the user is not found")
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

