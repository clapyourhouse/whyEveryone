//
//  ViewController.swift
//  firebasehogeeeeeeeee
//
//  Created by ShogoKitamura on 2018/09/09.
//  Copyright © 2018年 clapyourhouse labs. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { _, _ in
                print("push permission finished")
            }
            //追加
            User.anonymousLogin() { user in
                print(user)
            }
        }

}

