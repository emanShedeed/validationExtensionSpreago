//
//  BaseVC.swift
//  Ataba
//
//  Created by eman shedeed on 8/6/19.
//  Copyright © 2019 eman shedeed. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    //MARK:- IBAction
    //MARK:- Variables
    //    lazy var activityIndicator : SYActivityIndicatorView = {
    //        let image = UIImage.loading
    //        return SYActivityIndicatorView(image: UIImage.loading,title: "loader.messageTitle".localized)
    //    }()
    //Floating button parameters
    var floatingButton: UIButton?
    var editRowActionIndex:Int?
    // TODO: Replace image name with your own image:
    let floatingButtonImageName = UIImage.float!
    let buttonHeight: CGFloat = 60.0
    let buttonWidth: CGFloat = 60.0
    let trailingValue: CGFloat = 15.0
    var leadingValue: CGFloat = 100
    let shadowRadius: CGFloat = 2.0
    let shadowOpacity: Float = 0.2
    let shadowOffset = CGSize(width: 0.0, height: 5.0)
    let scaleKeyPath = "scale"
    let animationKeyPath = "transform.scale"
    let animationDuration: CFTimeInterval = 0.4
    let animateFromValue: CGFloat = 1.00
    let animateToValue: CGFloat = 1.05
    var swipeOneTime = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        styleNavBar()
        //        TransparentNavBar()
        swipeOneTime = true
    }
    
    func TransparentNavBar(){ self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func styleNavBar(){
        //   self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),NSAttributedString.Key.foregroundColor:UIColor.white]
        UINavigationBar.appearance().tintColor = UIColor.white
    }
    
    //MARK:- Floating Button
    func createFloatingButton() {
        floatingButton = UIButton(type: .custom)
        floatingButton?.translatesAutoresizingMaskIntoConstraints = false
        //floatingButton?.backgroundColor = .white
        floatingButton?.setBackgroundImage(UIImage.float!, for: .normal)
        floatingButton?.addTarget(self, action: #selector(doThisWhenButtonIsTapped(_:)), for: .touchUpInside)
        constrainFloatingButtonToWindow()
        makeFloatingButtonRound()
        addShadowToFloatingButton()
        addScaleAnimationToFloatingButton()
    }
    @objc func doThisWhenButtonIsTapped(_ sender: Any) {
        print("Floating button tapped")
    }
    private func constrainFloatingButtonToWindow() {
        DispatchQueue.main.async {
            guard let keyWindow = UIApplication.shared.keyWindow,
                let floatingButton = self.floatingButton else { return }
            keyWindow.addSubview(floatingButton)
            keyWindow.trailingAnchor.constraint(equalTo: floatingButton.trailingAnchor,
                                                constant: self.trailingValue).isActive = true
            keyWindow.bottomAnchor.constraint(equalTo: floatingButton.bottomAnchor,
                                              constant: self.leadingValue).isActive = true
            floatingButton.widthAnchor.constraint(equalToConstant:
                self.buttonWidth).isActive = true
            floatingButton.heightAnchor.constraint(equalToConstant:
                self.buttonHeight).isActive = true
        }
    }
    
    private func makeFloatingButtonRound() {
        floatingButton?.layer.cornerRadius = buttonHeight/2
    }
    
    private func addShadowToFloatingButton() {
        floatingButton?.layer.shadowColor = UIColor.black.cgColor
        floatingButton?.layer.shadowOffset = shadowOffset
        floatingButton?.layer.masksToBounds = false
        floatingButton?.layer.shadowRadius = shadowRadius
        floatingButton?.layer.shadowOpacity = shadowOpacity
    }
    
    private func addScaleAnimationToFloatingButton() {
        // Add a pulsing animation to draw attention to button:
        DispatchQueue.main.async {
            let scaleAnimation: CABasicAnimation = CABasicAnimation(keyPath: self.animationKeyPath)
            scaleAnimation.duration = self.animationDuration
            scaleAnimation.repeatCount = .greatestFiniteMagnitude
            scaleAnimation.autoreverses = true
            scaleAnimation.fromValue = self.animateFromValue
            scaleAnimation.toValue = self.animateToValue
            self.floatingButton?.layer.add(scaleAnimation, forKey: self.scaleKeyPath)
        }
    }
    //MARK:- serachBar
    func setupSearchBar(searchBar:UISearchBar){
        searchBar.barTintColor = UIColor(rgb: 0xF7F7F7)
        var searchTextField = UITextField()
        
        if #available(iOS 13.0, *) {
            searchTextField = searchBar.searchTextField
        } else {
            // Fallback on earlier versions
            searchTextField =  searchBar.value(forKey: "searchField") as? UITextField ?? UITextField()
        }
        searchTextField.backgroundColor = UIColor(rgb: 0xF7F7F7)
        searchBar.addBorderWith(borderColor: UIColor(rgb: 0xEFEFEF), borderWith: 1.0, borderCornerRadius: 10.0)
    }
    func logOut(){
        let alert=UIAlertController(title: "", message: "Are You Sure You Want To Logout?", preferredStyle: .alert)
        let okAction=UIAlertAction(title: "OK", style: .default) { (action) in
            let userDefault = UserDefaults.standard
            userDefault.removeObject(forKey: "user")
            userDefault.removeObject(forKey: "isOpenedThroughURL")
            
            let storyboard = UIStoryboard.main
            if let splashVC=storyboard.instantiateInitialViewController(){
                UIApplication.shared.keyWindow?.rootViewController = splashVC
            }
            
        }
        let cancelAction=UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}
