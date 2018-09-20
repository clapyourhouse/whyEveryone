//
//  Model.swift
//  firebasehogeeeeeeeee
//
//  Created by shogo.kitamura on 9/14/18.
//  Copyright © 2018 clapyourhouse labs. All rights reserved.
//

import Foundation
import Pring
import FirebaseAuth

//クラス全体に対し一括でObjective-Cから使用できることを明示的に宣言します
@objcMembers
class User: Object {
    dynamic var name: String?
    dynamic var fcmToken: String?
    dynamic var books: NestedCollection<Book> = []
    
    static func anonymousLogin(_ completionHandler: @escaping ((User?) -> Void)) {
        Auth.auth().signInAnonymously { (auth, error) in
            if let error = error {
                print(error.localizedDescription)
                completionHandler(nil)
                return
            }
            //guard? エラーが発生したら終了やこの値は来てほしくない時にguardを使う
            guard let currentUser = Auth.auth().currentUser else {
                completionHandler(nil)
                return
            }
            
            User.get(currentUser.uid) { (user, _) in
                if let user = user {
                    print("Success login of an existing user")
                    completionHandler(user)
                } else {
                    let u = User(id: auth!.user.uid)
                    u.name = "Alice"
                    u.save() { ref, error in
                        print("Success login of a new user")
                        completionHandler(u)
                    }
                }
            }
        }
    }
}

@objcMembers
class Book: Object {
    //dynamic?
    dynamic var name: String?
}



