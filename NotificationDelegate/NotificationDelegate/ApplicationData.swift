//
//  ApplicationData.swift
//  NotificationDelegate
//
//  Created by Renato on 07/02/23.
//

import SwiftUI
import UserNotifications

class ApplicationData: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    override init() {
        super.init()
        let center = UNUserNotificationCenter.current()
        center.delegate = self
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async ->
        UNNotificationPresentationOptions{
            return [.banner]
        }
} //end class
