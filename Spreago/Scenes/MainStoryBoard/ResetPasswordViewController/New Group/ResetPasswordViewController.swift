//
//  ResetPasswordViewController.swift
//  Spreago
//
//  Created by eman shedeed on 7/1/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController, UITextFieldDelegate {
    
    //MARK:- IBOutlet
    
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet var textFieldsTitleLabels: [UILabel]!
    @IBOutlet var validationLabels: [UILabel]!
    @IBOutlet weak var continueBtn: UIButton!
    
    //MARK:- Variables
    
    var presenter:ResetPasswordPresenter!
    var placeHolder = ""
    var validityTypes : [String.ValidityType]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        presenter = ResetPasswordPresenter(view: self)
        setupView()
    }
    //MARK:- Functions
    func setupView(){
        validityTypes = [.email]
        //textFields
        textFields.forEach { (textField) in
            textField.delegate=self
            textField.addBorderWith(borderColor: UIColor.ButtonBorder!, borderWith: 1.0, borderCornerRadius: 10)
            textField.setLeftPaddingPoints(10.0)
            ///
            //            textField.keyboardToolbar.nextBarButton.setTarget(self, action: #selector(nextBtnPressed))
            textField.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(nextBtnPressed))
        }
        
        //Buttons
        continueBtn.applyShadowWithCornerRadiusAndGradients(cornerRadius: 10.0, borderColor: UIColor.clear, borderWidth: 0.0, with: [UIColor.buttonGradient1!,UIColor.buttonGradient2!], gradient: .horizontal, shadowOffset: CGSize.zero, shadowColor: UIColor.buttonShadow!, shadowOpacity: 1.0, shadowRadius: 3)
        
    }
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        //            self.dismiss(animated: true, completion: nil)
    }
    @IBAction func continueBtnPressed(_ sender: Any) {
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
            //              presenter.sendPinCodeForRegister(email: textFields[0].text!)
            presenter.sendPinCodeForpasswordreset(email: textFields[0].text!)
        }
        
    }
}
extension ResetPasswordViewController{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case textFields[0]:
            let (valid, message) = (textField.text?.IsValid(validityTypes[0]))!
            
            if valid {
                textFields[0].resignFirstResponder()
            }
            
            // Update Password Validation Label
            validationLabels[0].text = message
            
            // Show/Hide Password Validation Label
            UIView.animate(withDuration: 0.25, animations: {
                self.validationLabels[0].isHidden = valid
            })
            
        default:
            return true
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
//            return (text.count == 0 ? ( (text.count > 0, "Required Field") ) : (emailTest.evaluate(with:textField.text), "Invalid Email Address."))
//        }
//        /* if textField == textFields[1] {
//         let passwordRegex="^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,200}$"
//         let passwordTest=NSPredicate(format: "SELF MATCHES %@", passwordRegex)
//         return(passwordTest.evaluate(with: textField.text ),"6-200 characters, password must contain capital,small letters and numbers.")
//         //return (text.count >= 6, "Your password is too short.")
//         }*/
//
//
//        return (text.count > 0, "Required Field")
//    }
}
