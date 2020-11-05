//
//  LoginWithEmailAddressViewController.swift
//  Spreago
//
//  Created by eman shedeed on 6/29/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import UIKit
import GoogleSignIn
import ProgressHUD
class LoginWithEmailAddressViewController: UIViewController,UITextFieldDelegate {
    
    //MARK:- IBOutlet
    
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet var textFieldsTitleLabels: [UILabel]!
    @IBOutlet var validationLabels: [UILabel]!
    @IBOutlet weak var togglePasswordAppearanceBtn: UIButton!
    @IBOutlet weak var rememberMeBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var continueWithGoogleBtn: UIButton!
   
    //MARK:- Variables
    var presenter:LoginWithEmailAddressPresenter!
     var introductionPresenter:IntroductionPresenter!
    var placeHolder = ""
    var label :UILabel = UILabel()
    //socila login
    var name:String=""
    var email:String=""
    var socialProvider:String=""
    var googleToken:String=""
    var validityTypes : [String.ValidityType]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        presenter = LoginWithEmailAddressPresenter(view: self)
        introductionPresenter = IntroductionPresenter(view: self)
        setupView()
    }
    //MARK:- Functions
    func setupView(){
        validityTypes = [.email,.required]
        //textFields
        textFields.forEach { (textField) in
            textField.delegate=self
            textField.addBorderWith(borderColor: UIColor.ButtonBorder!, borderWith: 1.0, borderCornerRadius: 10)
            textField.setLeftPaddingPoints(10.0)
            ///
            textField.keyboardToolbar.nextBarButton.setTarget(self, action: #selector(nextBtnPressed))
            textField.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(nextBtnPressed))
        }
        
        //Buttons
        loginBtn.applyShadowWithCornerRadiusAndGradients(cornerRadius: 10.0, borderColor: UIColor.clear, borderWidth: 0.0, with: [UIColor.buttonGradient1!,UIColor.buttonGradient2!], gradient: .horizontal, shadowOffset: CGSize.zero, shadowColor: UIColor.buttonShadow!, shadowOpacity: 1.0, shadowRadius: 3)
        
        continueWithGoogleBtn.applyShadowWithCornerRadiusAndGradients(cornerRadius: 10.0, borderColor: UIColor.lightGray, borderWidth: 0.5, with: [UIColor.white,UIColor.white], gradient: .horizontal, shadowOffset: CGSize.zero, shadowColor: UIColor.lightGray, shadowOpacity: 0.7, shadowRadius: 3.0)
        
    }

    
    //MARK: - IBActions
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
//        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func togglePasswordAppearanceBtnPressed(_ sender: Any) {
        textFields[1].isSecureTextEntry = !textFields[1].isSecureTextEntry
        togglePasswordAppearanceBtn.setImage(textFields[1] .isSecureTextEntry ? UIImage.showPassword! : UIImage.hidePassword! , for: .normal)
    }
    
    @IBAction func rememberMeBtnPressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.setImage(UIImage.unCheck, for: .normal)
        sender.setImage(UIImage.check, for: .selected)
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        var isCompleted=true
        for (index,textField) in textFields.enumerated(){
            let (valid, message) = (textField.text?.IsValid(validityTypes[index]))!
            validationLabels[index].isHidden=valid
            validationLabels[index].text=message
            if(!valid){
                isCompleted=false
                // break
            }
        }
        if isCompleted{
            // self.performSegue(withIdentifier: "goToMovesHomeVC", sender: self)
            UserDefaults.standard.set(rememberMeBtn.isSelected ? true : false, forKey: Constants.Defaults.rememberMe)
            presenter.login(logindata: attempt(email: textFields[0].text!, password: textFields[1].text!))
        }
        
    }
    
    @IBAction func signUpBtnPressed(_ sender: Any) {
        let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
             self.show(signUpVC, sender: self)
    }
    
    @IBAction func forgotPasswordBtnPressed(_ sender: Any) {
        let resetPasswordVC = self.storyboard?.instantiateViewController(withIdentifier: "ResetPasswordViewController") as! ResetPasswordViewController
//            self.show(resetPasswordVC, sender: self)
             self.navigationController?.pushViewController(resetPasswordVC, animated: true)
    }

}
extension LoginWithEmailAddressViewController{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case textFields[0]:
            let (valid, message) = (textFields[0].text?.IsValid(validityTypes[0]))!
            
            if valid {
                textFields[1].becomeFirstResponder()
            }
            
            // Update Password Validation Label
            validationLabels[0].text = message
            
            // Show/Hide Password Validation Label
            UIView.animate(withDuration: 0.25, animations: {
                self.validationLabels[0].isHidden = valid
            })
            
        default:
            let (valid, message) = (textField.text?.IsValid(validityTypes[1]))!
            
            if valid {
                textFields[1].resignFirstResponder()
            }
            
            // Update Password Validation Label
            validationLabels[1].text = message
            
            // Show/Hide Password Validation Label
            UIView.animate(withDuration: 0.25, animations: {
                self.validationLabels[1].isHidden = valid
            })
        }
        return true
    }
    @objc func nextBtnPressed(textField:UITextField){
          _ = textFieldShouldReturn(textField)
      }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addBorderWith(borderColor: UIColor.appColor2!, borderWith: 1.0, borderCornerRadius: 10)
        placeHolder = textField.placeholder ?? ""
        textField.placeholder = ""
        textFieldsTitleLabels.forEach { (titleLbl) in
            if(titleLbl.tag == textField.tag){
                titleLbl.isHidden = false
                titleLbl.textColor = UIColor.appColor2
            }
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.addBorderWith(borderColor: UIColor.ButtonBorder!, borderWith: 1.0, borderCornerRadius: 10)
        if textField.placeholder == ""{
            textField.placeholder = placeHolder
        }
        
        textFieldsTitleLabels.forEach { (titleLbl) in
            if(titleLbl.tag == textField.tag){
                if(textField.text != ""){
                    titleLbl.isHidden = false
                    titleLbl.textColor = UIColor.ButtonBorder
                }else{
                    titleLbl.isHidden = true
                }
            }
        }
    }
    // MARK: - Helper Methods
//    fileprivate func validate(_ textField: UITextField) -> (Bool, String?) {
//        guard let text = textField.text else {
//            return (false, nil)
//        }
//
//        if textField == textFields[0] {
//            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//           return (text.count == 0 ? ( (text.count > 0, "Required Field") ) : (emailTest.evaluate(with:textField.text), "Invalid Email Address."))
//        }
//       /* if textField == textFields[1] {
//            let passwordRegex="^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,200}$"
//                       let passwordTest=NSPredicate(format: "SELF MATCHES %@", passwordRegex)
//                       return(passwordTest.evaluate(with: textField.text ),"6-200 characters, password must contain capital,small letters and numbers.")
//            //return (text.count >= 6, "Your password is too short.")
//        }*/
//
//
//        return (text.count > 0, "Required Field.")
//    }
}
//google signin
extension LoginWithEmailAddressViewController{
    @IBAction func googleSignInBtnPressed(_ sender: Any) {
        let  _=NotificationCenter.default.addObserver(forName: .didReceiveGoogleData, object: nil, queue: nil) { (notification) in
            if let data = notification.userInfo as? [String: String]
            {
                // socialData=data
                ProgressHUD.dismiss()
                self.view.isUserInteractionEnabled = true
                if let namest=data["name"]{
                    self.name=namest
                }
                if let tokenst=data["idToken"]{
                    self.googleToken=tokenst
                }
                if let emailst=data["email"]{
                    self.email=emailst
                }
                
                //                if(!self.segued){
                //                    self.segued=true
                self.introductionPresenter.loginWithSocial(socialInput: SocialiteInput(token: self.googleToken, provider: "google"))
                //                }
                // NotificationCenter.default.removeObserver(googleLoginObserver)
                
            }
        }
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        // GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    
}
