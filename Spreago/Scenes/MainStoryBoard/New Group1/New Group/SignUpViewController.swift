//
//  signUpViewController.swift
//  Spreago
//
//  Created by eman shedeed on 6/29/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController , UITextFieldDelegate{
    
    //MARK:- IBOutlet
    
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet var textFieldsTitleLabels: [UILabel]!
    @IBOutlet var validationLabels: [UILabel]!
    @IBOutlet weak var signUpBtn: UIButton!
    
    //MARK:- Variables
    
    var presenter:SignUpPresenter!
    var placeHolder = ""
    var validityTypes : [String.ValidityType]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        presenter = SignUpPresenter(view: self)
        setupView()
    }
    
    //MARK:- Functions
    func setupView(){
        //textFields
        validityTypes = [.email]
        textFields.forEach { (textField) in
            textField.delegate=self
            textField.addBorderWith(borderColor: UIColor.ButtonBorder!, borderWith: 1.0, borderCornerRadius: 10)
            textField.setLeftPaddingPoints(10.0)
            ///
            //            textField.keyboardToolbar.nextBarButton.setTarget(self, action: #selector(nextBtnPressed))
            textField.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(nextBtnPressed))
        }
        
        //Buttons
        signUpBtn.applyShadowWithCornerRadiusAndGradients(cornerRadius: 10.0, borderColor: UIColor.clear, borderWidth: 0.0, with: [UIColor.buttonGradient1!,UIColor.buttonGradient2!], gradient: .horizontal, shadowOffset: CGSize.zero, shadowColor: UIColor.buttonShadow!, shadowOpacity: 1.0, shadowRadius: 3)
        
    }
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        //        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func signInBtnPressed(_ sender: Any) {
        let loginVC = UIStoryboard.main.instantiateViewController(withIdentifier: "LoginWithEmailAddressViewController") as! LoginWithEmailAddressViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
        //        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func signUpBtnPressed(_ sender: Any) {
        var isCompleted=true
        for (index,textField) in textFields.enumerated(){
            guard let text = textField.text else{return}
            let (valid, message) = text.IsValid(validityTypes[index])
            validationLabels[index].isHidden=valid
            validationLabels[index].text=message
            if(!valid){
                isCompleted=false
                // break
            }
        }
        if isCompleted{
            presenter.sendPinCodeForRegister(email: textFields[0].text!)
        }
        
    }
}
extension SignUpViewController{
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
}
