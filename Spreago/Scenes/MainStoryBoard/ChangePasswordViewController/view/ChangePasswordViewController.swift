//
//  ChangePasswordViewController.swift
//  Spreago
//
//  Created by eman shedeed on 7/6/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    //MARK:- IBOutlet
    
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet var textFieldsTitleLabels: [UILabel]!
    @IBOutlet var validationLabels: [UILabel]!
    @IBOutlet weak var confirmPasswordTopSpace: NSLayoutConstraint!
    @IBOutlet weak var continueBtnTopSpace: NSLayoutConstraint!
    //MARK:- Variables
    
    var presenter:ChangePasswordPresenter!
    var email:String!
    var pinCode:String!
    var placeHolder = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        presenter = ChangePasswordPresenter(view: self)
        setupView()
    }
    
    //MARK:- Functions
    
    func setupView(){
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
        continueBtn.applyShadowWithCornerRadiusAndGradients(cornerRadius: 10.0, borderColor: UIColor.clear, borderWidth: 0.0, with: [UIColor.buttonGradient1!,UIColor.buttonGradient2!], gradient: .horizontal, shadowOffset: CGSize.zero, shadowColor: UIColor.buttonShadow!, shadowOpacity: 1.0, shadowRadius: 3)
        
    }
    
    //MARK:- IBAction
    @IBAction func backBtnPressed(_ sender: Any) {
        let viewControllers = self.navigationController!.viewControllers
        var resetPasswordVC : UIViewController!
        viewControllers.forEach { (VC) in
            if let resetPassword = VC as? ResetPasswordViewController{
                resetPasswordVC = resetPassword
            }
            
        }
        self.navigationController?.popToViewController(resetPasswordVC!, animated: true)
        //           self.navigationController?.popViewController(animated: true)
        //          self.dismiss(animated: true, completion: nil)
    }
    @IBAction func togglePasswordAppearanceBtnPressed(_ sender: UIButton) {
        textFields[sender.tag-1].isSecureTextEntry = !textFields[sender.tag-1].isSecureTextEntry
        sender.setImage(textFields[sender.tag-1].isSecureTextEntry ? UIImage.showPassword : UIImage.hidePassword, for: .normal)
    }
    @IBAction func continueBtnPressed(_ sender: Any) {
        var isCompleted=true
        for (index,textField) in textFields.enumerated(){
            var (valid, message)=(true,"")
            switch index {
            case 0:
                (valid, message) = (textField.text?.IsValid(.password))!
                if valid{
                    confirmPasswordTopSpace.constant = 20
                }else{
                    confirmPasswordTopSpace.constant = 60
                }
            //validate(textField)
            default:
                (valid, message) = (textField.text?.isConfirm(to: textFields[0].text ?? ""))!  //validate(textField)
                if valid{
                    continueBtnTopSpace.constant = 30
                }else{
                     continueBtnTopSpace.constant = 60
                }
            }
            validationLabels[index].isHidden=valid
            validationLabels[index].text=message
            if(!valid){
                isCompleted=false
                // break
            }
        }
        if isCompleted{
            presenter.resetpassword(forgotPasswordInput: forgotPasswordinput(password: textFields[1].text! ), verifyPinCodeInput: verifyPinCodeInput(email: email, pinCode: pinCode))
        }
        
    }
    
}
extension ChangePasswordViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case textFields[0]:
            let (valid, message) = (textField.text?.IsValid(.password))!
            
            if valid {
                textFields[1].becomeFirstResponder()
                confirmPasswordTopSpace.constant = 20
            }else{
                confirmPasswordTopSpace.constant = 60
            }
            
            // Update Password Validation Label
            validationLabels[0].text = message
            
            // Show/Hide Password Validation Label
            UIView.animate(withDuration: 0.25, animations: {
                self.validationLabels[0].isHidden = valid
            })
            
        default:
            let (valid, message) = (textField.text?.isConfirm(to: textFields[0].text ?? ""))!
            
            if valid {
                textFields[1].resignFirstResponder()
                  continueBtnTopSpace.constant = 30
            }else{
                 continueBtnTopSpace.constant = 60
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
    //        var valid = false
    //        if (textField == textFields[0] ){
    //            let passwordRegex="^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,200}$"
    //            let passwordTest=NSPredicate(format: "SELF MATCHES %@", passwordRegex)
    //            valid = passwordTest.evaluate(with: textField.text)
    //            if(valid){
    //                confirmPasswordTopSpace.constant = 20
    //            }else{
    //                confirmPasswordTopSpace.constant = 60
    //            }
    //          return(text.count == 0 ? ( (text.count > 0, "Required Field.") ) : (passwordTest.evaluate(with: textField.text),"Password must be between 8-200 characters, including at least one capital letter, one small letter and a number."))
    //        }
    //
    //        if textField == textFields[1] {
    //            valid = textFields[0].text == textFields[1].text ? true : false
    //            if(valid){
    //                continueBtnTopSpace.constant = 30
    //            }else{
    //                continueBtnTopSpace.constant = 60
    //            }
    //            return(valid,"Your password and confirmation password do not match.")
    //            //return (text.count >= 6, "Your password is too short.")
    //        }
    //
    //
    //        return (text.count > 0, "Required Field")
    //    }
}
