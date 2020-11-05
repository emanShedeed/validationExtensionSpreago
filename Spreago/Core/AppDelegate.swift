//
//  AppDelegate.swift
//  Spreago
//
//  Created by eman shedeed on 6/9/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import UIKit
import GoogleSignIn
import IQKeyboardManager
import Apollo

var  apollo = { () -> ApolloClient in
    // let url = URL(string: "http://34.67.179.88/Ataba/public/graphql")!
  //  let url = URL(string: "https://ataba.blacksquaressolutions.com/graphql")!
     let url = URL(string: "https://spreago.black-squares.com/graphql")!
    
    let user=Helper.getUserDetails()
    let configuration = URLSessionConfiguration.default
    if let accessToken = user["accessToken"] as? String{
        let auth="Bearer " + accessToken
        configuration.httpAdditionalHeaders = ["localization":"en","Authorization":auth]
    }else{
        configuration.httpAdditionalHeaders = ["localization":"en"]
    }
    let urlSession=URLSession(configuration: configuration)
//    let cache = try? SQLiteNormalizedCache(fileURL: AppDelegate().createSQLiteFileURL())
//    let store = ApolloStore(cache: cache ?? InMemoryNormalizedCache())
//
//    return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, session: urlSession, sendOperationIdentifiers: false, useGETForQueries: false, delegate: nil),store: store)
    return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, session: urlSession, sendOperationIdentifiers: false, useGETForQueries: false, delegate: nil))
}()
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,GIDSignInDelegate {


  var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
         IQKeyboardManager.shared().isEnabled = true
        ///google signin
           // Initialize sign-in
        GIDSignIn.sharedInstance().clientID = Constants.googleSignInClientID
           GIDSignIn.sharedInstance().delegate = self
        return true
    }
    ////Google_signIn
      func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
                withError error: Error!) {
          if let error = error {
              print("\(error.localizedDescription)")
          } else {
              // Perform any operations on signed in user here.
              let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.accessToken // Safe to send to the server
            let fullName = user.profile.name
              let givenName = user.profile.givenName
              let familyName = user.profile.familyName
              let email = user.profile.email
              var profileImageURL:String?
              if user.profile.hasImage
              {
                  let URL=user.profile.imageURL(withDimension: 100)
                  profileImageURL=URL?.absoluteString ?? ""
              }
              if (userId != nil){
                  
                  let googleUserInfo = ["id": userId,"idToken": idToken, "name": fullName,"givenName":givenName,"familyName":familyName,"email":email,"picture":profileImageURL]
                  
                  //NotificationCenter.default.postNotification(name: .didReceiveData, object: self, userInfo: googleUserInfo)
                  NotificationCenter.default.post(name: .didReceiveGoogleData, object: self, userInfo: googleUserInfo as [AnyHashable : Any])
              }
              // delegate?.googleSignIn(userinfo: googleUserInfo )
          }
      }
      func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
                withError error: Error!) {
          // Perform any operations when the user disconnects from app here.
          // ...
          NotificationCenter.default.post(name: .didFailReceiveGoogleData, object: error.localizedDescription)
          
      }
      @available(iOS 9.0, *)
      func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
          return GIDSignIn.sharedInstance().handle(url)
      }
      func application(_ application: UIApplication,
                       open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
          return GIDSignIn.sharedInstance().handle(url)
      }
      ///////////////
    // MARK: UISceneSession Lifecycle


}

