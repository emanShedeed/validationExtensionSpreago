//
//  RegistrationFormPresenter.swift
//  Spreago
//
//  Created by eman shedeed on 7/7/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import Foundation

import Foundation
import Apollo
import ProgressHUD
protocol RegistrationFormViewControllerProtcol :BaseProtocol{
    func fetchCountriesSucess(info:[CountryInfo])
    func registerSuccess(auth:[String:Any])
}
class RegistrationFormPresenter{
    private weak var view : RegistrationFormViewControllerProtcol?
    var countriesArray : [CountryInfo]?
    init(view:RegistrationFormViewControllerProtcol) {
        self.view=view
    }
    func getCountries(){
        view?.showProgress()
        let countriesQuery=CountriesQuery()
        apollo.fetch(query:countriesQuery) { [weak self] result in
            self?.view?.hideProgress()
            switch result {
            case .success(let parameter):
                if let error=parameter.errors?.first?.message{
                    self?.view?.showError(error: error)
                }
                else{
                    guard let countriesTemp = parameter.data?.countries else { return }
                    self?.countriesArray=countriesTemp.compactMap{ $0.fragments.countryInfo}
                    
                    self?.view?.fetchCountriesSucess(info: self?.countriesArray ?? [])
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func register(userData:newUserInput,verifyPinCodeInput:verifyPinCodeInput,socialiteInput: SocialiteInput){
        view?.showProgress()
        let registerMutation=RegisterMutation(newUserInput: userData, verifyPinCodeInput: verifyPinCodeInput, SocialiteInput: socialiteInput)
        apollo.perform(mutation: registerMutation) { [weak self] result in
            self?.view?.hideProgress()
            switch result {
            case .success(let parameter):
                if let error=parameter.errors?.first?["debugMessage"] {
                    //print(error)
                    self?.view?.showError(error: error as! String)
                }
                else {
                    if(parameter.data?.register.status?.check ?? false){
                        if let user = parameter.data?.register.user, let breaer = parameter.data?.register.bearerTokenResponse{
                            let userInfo=["userID":user.id ,
                                          "userName":user.name,
                                          "userEmail":user.email,
//                                          "havePassword":user.needPassword,
                                 "userType":user.type.id,
                                          "accessToken":breaer.accessToken
                                ] as [String : Any]
                            DispatchQueue.main.async(){ self?.view?.registerSuccess(auth: userInfo )
                            }
                        }
                    }else{
                        self?.view?.showToast(message: parameter.data?.register.status?.message ?? "problem register new user")
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
