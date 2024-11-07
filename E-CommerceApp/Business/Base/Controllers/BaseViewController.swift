//
//  BaseViewController.swift
//  E-CommerceApp
//
//  Created by Bakhtiyar Pirizada on 05.11.24.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureConstraints()
    }
    open func configureUI() {
        view.backgroundColor = .white
    }
    open func configureConstraints() {
        
    }
}
