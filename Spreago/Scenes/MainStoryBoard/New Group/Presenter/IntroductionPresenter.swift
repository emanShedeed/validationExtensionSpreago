//
//  IntroductionPresenter.swift
//  Spreago
//
//  Created by eman shedeed on 6/30/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import Foundation
import Apollo
import ProgressHUD
protocol BaseProtocol:class {
    func showError(error:String)
    func showToast(message:String)
    func showProgress()
    func hideProgress()
}
extension BaseProtocol{
    func showToast(message:String){
        print(message)
    }
}
protocol IntroductionViewControllerProtcol :BaseProtocol{
    func showRegistrationForm()
    func loginWithSocialSuccess(auth:[String:Any])
}
/// This is a presenter class created for handling MovesHomeVC Functions.
class IntroductionPresenter{
    private weak var view : IntroductionViewControllerProtcol?
    // private var userTasks:Results<Task>!
    //   var tasksArray:[Task]?
    init(view:IntroductionViewControllerProtcol) {
        self.view=view
    }
    func loginWithSocial(socialInput:SocialiteInput){
        //        ProgressHUD.backgroundColor(UIColor.blue)
        //        ProgressHUD.spinnerColor(UIColor(rgb: 0xDB9126))
        //        ProgressHUD.statusColor(UIColor.blue)
        //        ProgressHUD.show()
        view?.showProgress()
        //        UIApplication.shared.beginIgnoringInteractionEvents()
        let loginSocialiteMutation=LoginSocialiteMutation(SocialiteInput: socialInput)
        apollo.perform(mutation: loginSocialiteMutation) { [weak self] result in
            self?.view?.hideProgress()
            switch result {
            case .success(let parameter):
                if let error=parameter.errors?.first?["debugMessage"] {
                    print(error)
                    self?.view?.showError(error: error as! String)
                }
                else {
                    if let user = parameter.data?.loginSocialite.user, let breaer = parameter.data?.loginSocialite.bearerTokenResponse{
                    let userInfo=["userID":user.id ,
                                  "userName":user.name,
                                  "userEmail":user.email,
//                                  "havePassword":user.needPassword,
                                "userType":user.type.id,
                                  "accessToken":breaer.accessToken
                        ] as [String : Any]
                    
                    DispatchQueue.main.async(){
                        
                        self?.view?.loginWithSocialSuccess(auth: userInfo)
                    }
                    }
                    else {
                        self?.view?.showRegistrationForm()
                        print(parameter.data?.loginSocialite.status?.message)
                    }
                    //self?.view?.showError(error: (parameter.data?.register.message) ?? " ")
                    // print(parameter.data?.register.message)
                }
            case .failure(let error):
                // print(error.localizedDescription)
                if(!Helper.isConnectedToNetwork()){
                    self?.view?.showError(error: "Check your internet connection and try again." )
                }else{
                    self?.view?.showError(error: error.localizedDescription )
                }
            }
            
        }
    }
}

