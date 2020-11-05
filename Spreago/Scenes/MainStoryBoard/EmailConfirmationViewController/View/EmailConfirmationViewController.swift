//
//  EmailConfirmationViewController.swift
//  Spreago
//
//  Created by eman shedeed on 7/5/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import UIKit

class EmailConfirmationViewController: UIViewController {
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var verifyBtn: UIButton!
    @IBOutlet var confirmationCodeTextFields: [UITextField]!
    @IBOutlet var underLineViews: [UIView]!
    @IBOutlet var underLineViewsHeight: [NSLayoutConstraint]!
    //MARK:- Variables
    var email:String!
    var confirmationCode=""
    var presenter:EmailConfirmationPresenter!
    var signUpPresenter :SignUpPresenter!
    var isResetPassword: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        presenter = EmailConfirmationPresenter(view: self)
        signUpPresenter = SignUpPresenter(view: self)
        setupView()
    }
    
    func setupView(){
        
        verifyBtn.applyShadowWithCornerRadiusAndGradients(cornerRadius: 10.0, borderColor: UIColor.clear, borderWidth: 0.0, with: [UIColor.buttonGradient1!,UIColor.buttonGradient2!], gradient: .horizontal, shadowOffset: CGSize.zero, shadowColor: UIColor.buttonShadow!, shadowOpacity: 1.0, shadowRadius: 3)
        
        for textbox in confirmationCodeTextFields{
            textbox.delegate = self
            //            textbox.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneBtnPressed))
            textbox.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        }
        confirmationCodeTextFields[0].becomeFirstResponder()
         confirmationCodeTextFields[0].tintColor = UIColor.appColor2
    }
    
    //MARK:- IBAction
    
    @IBAction func backBtnPressed(_ sender: Any) {
           self.navigationController?.popViewController(animated: true)
//          self.dismiss(animated: true, completion: nil)
      }
    @IBAction func verifyBtnPressed(_ sender: Any) {
        var confirmationCode=""
        for textField in confirmationCodeTextFields{
            confirmationCode=confirmationCode + (textField.text ?? "")
        }
        if(confirmationCode.count == 5){
            presenter.verifyPinCode(email: email, pinCode: confirmationCode)
            
        }else{
            //               Helper.showAlert(title: "", message: "Please enter valid code", VC: self)
            Helper.showToast(message: "Please enter valid code")
        }
    }
    @IBAction func resendNowBtnPressed(_ sender: Any) {
        signUpPresenter.sendPinCodeForRegister(email: email)
    }
}
extension EmailConfirmationViewController:UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
         textField.tintColor = UIColor.appColor2
       
        underLineViews.forEach { (view) in
            view.backgroundColor = UIColor(rgb: 0x333333)
//            view.bounds.size.height = 1.0
        }
        underLineViewsHeight.forEach { (constraint) in
            constraint.constant = 1.0
        }
        if let index = confirmationCodeTextFields.firstIndex(of: textField){
            underLineViews[index].backgroundColor = UIColor.appColor2!
//             underLineViews[index].bounds.size.height = 10.0
            underLineViewsHeight[index].constant = 3.0
        }
   
    }
    
    @objc func textFieldDidChange(textField:UITextField) {
        let text=textField.text
        if (text?.count==1){
            switch textField {
            case confirmationCodeTextFields[0]:
                confirmationCodeTextFields[1].becomeFirstResponder()
            case confirmationCodeTextFields[1]:
                confirmationCodeTextFields[2].becomeFirstResponder()
            case confirmationCodeTextFields[2]:
                confirmationCodeTextFields[3].becomeFirstResponder()
            case confirmationCodeTextFields[3]:
                confirmationCodeTextFields[4].becomeFirstResponder()
            default:
                confirmationCode=""
                for textField in confirmationCodeTextFields{
                    confirmationCode=confirmationCode + (textField.text ?? "")
                }
                // ConfirmCode(mobile:mobile,code:confirmationCode)
                //                presenter.checkForgetPasswordCode(email: email, pincode: confirmationCode)
                break
            }
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
}
