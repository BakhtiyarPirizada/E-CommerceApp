//
//  RegisterController.swift
//  E-CommerceApp
//
//  Created by Bakhtiyar Pirizada on 05.11.24.
//

import UIKit
import RealmSwift

class RegisterController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Get on-disk location of the default Realm
        let realm = try! Realm()
        print("Realm is located at:", realm.configuration.fileURL!)
    }


}

