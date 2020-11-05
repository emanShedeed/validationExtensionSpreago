//
//  RegistrationFormViewController.swift
//  Spreago
//
//  Created by eman shedeed on 6/30/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import UIKit

class RegistrationFormViewController: UIViewController , UITextFieldDelegate{
    
    //MARK: - IBOutlet
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet var textFieldsTitleLabels: [UILabel]!
     @IBOutlet var validationLabels: [UILabel]!
    @IBOutlet weak var countryValidationLabel: UILabel!
    @IBOutlet weak var cityValidationLabel: UILabel!
    @IBOutlet weak var passwordTxtTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var stackViewTopConstarint: NSLayoutConstraint!
    @IBOutlet weak var countryBtn: UIButton!
    @IBOutlet weak var cityBtn: UIButton!
    @IBOutlet weak var employerBtn: UIButton!
    @IBOutlet weak var applicantBtn: UIButton!
    @IBOutlet weak var getStartedBtn: UIButton!
    @IBOutlet weak var countrytableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var citytableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var countryAutoCombleteTV: FullHeightTableView!{ didSet{
        countryAutoCombleteTV.contentSizeChanged = {
            [weak self] newHeight in
            if (newHeight > 100){
                self?.countrytableViewHeight.constant = 160
            }else{
                self?.countrytableViewHeight.constant = newHeight
            }
        }
        }
    }
    @IBOutlet weak var cityAutoCombleteTV: FullHeightTableView!{ didSet{
        cityAutoCombleteTV.contentSizeChanged = {
            [weak self] newHeight in
            if (newHeight > 100){
                self?.citytableViewHeight.constant = 160
            }else{
                self?.citytableViewHeight.constant = newHeight
            }
        }
        }
    }
    //MARK:- Variables
    var placeHolder = ""
     var presenter:RegistrationFormPresenter!
    var countriesInfoArray : [(CountryInfo)]?
    var countriesArray = [(id:Int,name:String)]()
    var citiesArray = [(id:Int,name:String)]()
    var selectedUserType : Int = 1
    var email:String!
    var pincode:String!
    var token : String?
    var provider : String?
    var userName:String?
    var validityTypes : [String.ValidityType]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        presenter = RegistrationFormPresenter(view: self)
        setupView()
    }
    override func viewWillAppear(_ animated: Bool) {
        presenter.getCountries()
    }
    //MARK:- Functions
      func setupView(){
        validityTypes = [.required,.password]
          //textFields
          textFields.forEach { (textField) in
              textField.delegate=self
              textField.addBorderWith(borderColor: UIColor.ButtonBorder!, borderWith: 1.0, borderCornerRadius: 10)
              textField.setLeftPaddingPoints(10.0)
              ///
              textField.keyboardToolbar.nextBarButton.setTarget(self, action: #selector(nextBtnPressed))
              textField.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(nextBtnPressed))
          }
        //if register using google i will display user name
        if(userName != nil){
        textFields[0].text=userName
            textFieldsTitleLabels[0].isHidden = false
            textFieldsTitleLabels[0].textColor = UIColor.ButtonBorder
        }
          //Buttons
          getStartedBtn.applyShadowWithCornerRadiusAndGradients(cornerRadius: 10.0, borderColor: UIColor.clear, borderWidth: 0.0, with: [UIColor.buttonGradient1!,UIColor.buttonGradient2!], gradient: .horizontal, shadowOffset: CGSize.zero, shadowColor: UIColor.buttonShadow!, shadowOpacity: 1.0, shadowRadius: 3)
        countryBtn.applyShadowWithCornerRadiusAndGradients(cornerRadius: 10.0, borderColor: UIColor.ButtonBorder!, borderWidth: 0.5, with: [UIColor.clear,UIColor.clear], gradient: .horizontal, shadowOffset: CGSize.zero, shadowColor: UIColor.clear, shadowOpacity: 0.0, shadowRadius: 0.0)
           cityBtn.applyShadowWithCornerRadiusAndGradients(cornerRadius: 10.0, borderColor: UIColor.ButtonBorder!, borderWidth: 0.5, with: [UIColor.clear,UIColor.clear], gradient: .horizontal, shadowOffset: CGSize.zero, shadowColor: UIColor.clear, shadowOpacity: 0.0, shadowRadius: 0.0)
        // radio
             employerBtn.isSelected = true
              employerBtn.setImage(UIImage.unCheckedRadioButton, for: .normal)
              employerBtn.setImage(UIImage.checkedRadioButton, for: .selected)
              applicantBtn.setImage(UIImage.unCheckedRadioButton, for: .normal)
              applicantBtn.setImage(UIImage.checkedRadioButton, for: .selected)
      }

    //MARK:IBACTION
    
    @IBAction func backBtnPressed(_ sender: Any) {
        let viewControllers = self.navigationController!.viewControllers
        var signUPVC : UIViewController?
        viewControllers.forEach { (VC) in
            if let signUp = VC as? SignUpViewController{
                signUPVC = signUp
            }
            
        }
        if let siginup = signUPVC{
        self.navigationController?.popToViewController(siginup, animated: true)
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    @IBAction func CountryBtnPressed(_ sender: Any) {
           countryAutoCombleteTV.isHidden = !( countryAutoCombleteTV.isHidden)
           cityAutoCombleteTV.isHidden=true
       }
       
       @IBAction func cityBtnPressed(_ sender: Any) {
           cityAutoCombleteTV.isHidden = !(cityAutoCombleteTV.isHidden)
           countryAutoCombleteTV.isHidden=true
       }
  @IBAction func radioButtonPressed(_ sender: UIButton) {
           if(sender.tag == 1 ){
               employerBtn.isSelected=true
               applicantBtn.isSelected = false
           }else if(sender.tag == 2 ){
             
               applicantBtn.isSelected = true
               employerBtn.isSelected = false
           }
      selectedUserType = sender.tag
       }
    @IBAction func togglePasswordAppearanceBtnPressed(_ sender: UIButton) {
             textFields[sender.tag-1].isSecureTextEntry = !textFields[sender.tag-1].isSecureTextEntry
          sender.setImage(textFields[sender.tag-1].isSecureTextEntry ? UIImage.showPassword : UIImage.hidePassword, for: .normal)
            }
    @IBAction func getStartedBtnPressed(_ sender: Any) {
        var isCompleted=true
        for (index,textField) in textFields.enumerated(){
            let (valid, message) = (textField.text?.IsValid(validityTypes[index]))!
            if(valid){
                if index == 0 {
                    passwordTxtTopConstraint.constant = 15
                }else{
                    stackViewTopConstarint.constant = 15
                }
                
            }else{
                if index == 0 {
                   passwordTxtTopConstraint.constant = 30
                }else{
                    stackViewTopConstarint.constant = 60 
                }
                
            }
            validationLabels[index].isHidden=valid
            validationLabels[index].text=message
            if(!valid){
                isCompleted=false
                // break
            }
        }
        if(countryBtn.tag == -1)
        {
            isCompleted = false
            countryValidationLabel.isHidden = false
        }else{
            countryValidationLabel.isHidden = true
        }
        if(cityBtn.tag == -1)
        {
            isCompleted = false
            cityValidationLabel.isHidden = false
        }else{
            cityValidationLabel.isHidden = true
        }
        
        
        if isCompleted{
            // self.performSegue(withIdentifier: "goToMovesHomeVC", sender: self)
            
            //            presenter.login(logindata: attempt(email: textFields[0].text!, password: textFields[1].text!))
            presenter.register(userData: newUserInput(name: textFields[0].text!, password: textFields[1].text!, countriesId: countryBtn.tag, citiesId: cityBtn.tag, userTypeId: selectedUserType), verifyPinCodeInput: verifyPinCodeInput(email: email, pinCode: pincode), socialiteInput: SocialiteInput(token: token, provider: provider))
        }
        
    }
}
extension RegistrationFormViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count : Int = 0
        if(tableView == countryAutoCombleteTV){
            count = countriesArray.count
        }else{
            count = citiesArray.count
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "automCompleteCell")!
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        if(tableView == countryAutoCombleteTV){
            cell.textLabel?.text=countriesArray[indexPath.row].name
            return cell
        }else{
            cell.textLabel?.text=citiesArray[indexPath.row].name
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(tableView == countryAutoCombleteTV){
            countryValidationLabel.isHidden=true
            countryAutoCombleteTV.isHidden=true
            cityBtn.tag = -1
            cityBtn.setTitle("City", for: .normal)
            let  selectedName = countriesArray[indexPath.row].name
            countryBtn.setTitle(selectedName, for: .normal)
            countryBtn.tag = countriesArray[indexPath.row].id
            countryBtn.setTitleColor(UIColor.black, for: .normal)
            if let countryObj=countriesInfoArray?.first(where: {$0.id == Int(countriesArray[indexPath.row].id)}){
                citiesArray=[]
                countryObj.cities.forEach { (city) in
                    citiesArray.append((id: city.id, name: city.name))
                }
                cityAutoCombleteTV.reloadData()
            }else{
                
                  citiesArray=[]
                  cityAutoCombleteTV.reloadData()
            }
            
        }else{
            cityValidationLabel.isHidden=true
            cityAutoCombleteTV.isHidden=true
            let  selectedName=citiesArray[indexPath.row].name
            cityBtn.setTitle(selectedName, for: .normal)
            cityBtn.tag = citiesArray[indexPath.row].id
            cityBtn.setTitleColor(UIColor.black, for: .normal)
        }
    }
}
extension RegistrationFormViewController{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case textFields[0]:
            let (valid, message) = (textField.text?.IsValid(validityTypes[0]))!
            
            if valid {
                textFields[1].becomeFirstResponder()
                passwordTxtTopConstraint.constant = 15
            }else{
                passwordTxtTopConstraint.constant = 30
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
//        var valid = false
//        if textField == textFields[0] {
//            valid = text.count > 0 ? true : false
//            if(valid){
//                passwordTxtTopConstraint.constant = 15
//            }else{
//                passwordTxtTopConstraint.constant = 30
//            }
//            return (text.count == 0 ? ( (valid, "Required Field.") ) : (true,""))
//        }
//        if textField == textFields[1] {
//                  let passwordRegex="^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,200}$"
//                  let passwordTest=NSPredicate(format: "SELF MATCHES %@", passwordRegex)
//            valid = (text.count > 0 && passwordTest.evaluate(with: textField.text) ) ? true : false
//            if(valid){
//                stackViewTopConstarint.constant = 15
//            }else{
//
//               stackViewTopConstarint.constant = text.count > 0 ?  60 :  30
//            }
//                  return(text.count == 0 ? ( (text.count > 0, "Required Field.") ) : (passwordTest.evaluate(with: textField.text),"Password must be between 8-200 characters, including at least one capital letter, one small letter and a number."))
//              }
//                return (text.count > 0, "Required Field.")
//    }
}
