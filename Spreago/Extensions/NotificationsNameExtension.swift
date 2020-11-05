//
//  NotificationsNameExtension.swift
//  Ataba
//
//  Created by eman shedeed on 9/16/19.
//  Copyright © 2019 eman shedeed. All rights reserved.
//

import NotificationCenter
extension Notification.Name {
    static let didReceiveGoogleData = Notification.Name("didReceiveGoogleData")
    static let didFailReceiveGoogleData = Notification.Name("didFailReceiveGoogleData")
    static let didCheckEmailStatus = Notification.Name("didCheckEmailStatus")
    static let didSendConfirmationCode = Notification.Name("didSendConfirmationCode")
    static let didReceiveJsonData = Notification.Name("didReceiveJsonData")
    //  static let didReceiveJsonData2 = Notification.Name("didReceiveJsonData2")
}
extension NotificationCenter{
    func setObserver(_ observer: AnyObject, selector: Selector, name: NSNotification.Name, object: AnyObject?) {
        NotificationCenter.default.removeObserver(observer, name: name, object: object)
        NotificationCenter.default.addObserver(observer, selector: selector, name: name, object: object)
    }
}
