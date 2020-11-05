//
//  ViewController.swift
//  Spreago
//
//  Created by eman shedeed on 6/9/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import UIKit
import GoogleSignIn
import ProgressHUD
class IntroductionViewController: UIViewController {
    //MARK: - IBOUtlet
    
    @IBOutlet weak var illustrationImageView: UIImageView!
    @IBOutlet weak var scrollImageView: UIImageView!
    @IBOutlet weak var continueWithEmailBtn: UIButton!
    @IBOutlet weak var continueWithGoogleBtn: UIButton!
    
    //MARK: - Variables
      var presenter:IntroductionPresenter!
      var illustrationImages :[UIImage] = [UIImage.illustration1!,UIImage.illustration2!,UIImage.illustration3!]
    
    var sliderImages :[UIImage] = [UIImage.scroll1!,UIImage.scroll2!,UIImage.scroll3!]
    //socila login
    var name:String=""
    var email:String=""
    var googleToken:String=""
    var socialProvider = "google"
    var segued=false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter = IntroductionPresenter(view: self)
      setupView()
     
    }
    override func viewWillAppear(_ animated: Bool) {
        segued = false
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    func setupView(){
        illustrationImageView.animationImages = illustrationImages
        illustrationImageView.animationDuration = 5
        illustrationImageView.startAnimating()
        
        scrollImageView.animationImages = sliderImages
        scrollImageView.animationDuration = 5
        scrollImageView.startAnimating()
        //
//        continueWithEmailBtn.applyGradient(with: [UIColor.ButtonGradient1!,UIColor.ButtonGradient2!], gradient: .horizontal)
        continueWithEmailBtn.applyShadowWithCornerRadiusAndGradients(cornerRadius: 10.0, borderColor: UIColor.clear, borderWidth: 0.0, with: [UIColor.buttonGradient1!,UIColor.buttonGradient2!], gradient: .horizontal, shadowOffset: CGSize.zero, shadowColor: UIColor.buttonShadow!, shadowOpacity: 1.0, shadowRadius: 3)

        continueWithGoogleBtn.applyShadowWithCornerRadiusAndGradients(cornerRadius: 10.0, borderColor: UIColor.lightGray, borderWidth: 0.5, with: [UIColor.white,UIColor.white], gradient: .horizontal, shadowOffset: CGSize.zero, shadowColor: UIColor.lightGray, shadowOpacity: 0.7, shadowRadius: 3.0)
            view.layoutIfNeeded()
        // *** *** Use following to add Shadow top, left ***
        //        shadowOffset = CGSizeMake(-5.0f, -5.0f);
        
        // *** Use following to add Shadow bottom, right ***
        //shadowOffset = CGSizeMake(5.0f, 5.0f);
        
        // *** Use following to add Shadow top, left, bottom, right ***
        // avatarImageView.layer.shadowOffset = CGSize.zero;
       

    }
    
    @IBAction func continueWithEmailAddressBtnPressed(_ sender: Any) {
        let loginWithEmailAddressVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginWithEmailAddressViewController") as! LoginWithEmailAddressViewController
        self.navigationController?.pushViewController(loginWithEmailAddressVC, animated: true)
//        self.show(loginWithEmailAddressVC, sender: self)
    }
    
    
  
    @IBAction func signUpBtnPressed(_ sender: Any) {
        let SignUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(SignUpVC, animated: true)
//        self.show(SignUpVC, sender: self)
    }
}

//google signin
extension IntroductionViewController{
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
                
                if(!self.segued){
                    self.segued=true
                    self.presenter.loginWithSocial(socialInput: SocialiteInput(token: self.googleToken, provider: self.socialProvider))
                }
                // NotificationCenter.default.removeObserver(googleLoginObserver)
                
            }
        }
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        // GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    
}
