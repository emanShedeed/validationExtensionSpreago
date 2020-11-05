//
//  UIString+Extension.swift
//  tryCleanCode
//
//  Created by eman shedeed on 2/9/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//
import UIKit
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    //Localization
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    public var EnToARDigits : String {
        let englishNumbers = ["0": "٠","1": "١","2": "٢","3": "٣","4": "٤","5": "٥","6": "٦","7": "٧","8": "٨","9": "٩"]
        var txt = self
        englishNumbers.map { txt = txt.replacingOccurrences(of: $0, with: $1)}
        return txt
    }
    
}
extension String{
    enum ValidityType{
        case required
        case email
        case password
    }
    enum Regx : String{
        case required = "^(?!\\s*$).+"
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case password = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,200}$"
    }
    enum ErrorMessage:String{
        case required = "Required Field"
        case email = "Invalid Email Address."
        case password = "Password must be between 8-200 characters, including at least one capital letter, one small letter and a number."
    }
    func IsValid(_ validityType: ValidityType) -> (Bool, String) {
        var regx = ""
        var errorMessage = ""
        switch validityType {
        case .email:
            regx = Regx.email.rawValue
            errorMessage = ErrorMessage.email.rawValue
        case .required:
            regx = Regx.required.rawValue
            errorMessage = ErrorMessage.required.rawValue
        case .password:
            regx = Regx.password.rawValue
            errorMessage = ErrorMessage.password.rawValue
            
        }
        let isValid = NSPredicate(format:"SELF MATCHES %@", regx).evaluate(with: self)
        return(isValid,errorMessage)
    }
    func isConfirm(to password: String) -> (Bool, String) {
        if self == password{
        return(true,"")
        }else{
          return(false,"Your password and confirmation password do not match.")
        }
    }
}
