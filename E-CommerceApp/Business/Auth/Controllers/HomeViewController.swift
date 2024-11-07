//
//  HomeViewController.swift
//  E-CommerceApp
//
//  Created by Bakhtiyar Pirizada on 05.11.24.
//

import UIKit

class HomeViewController: BaseViewController {

    private lazy var imageView: UIImageView = {
        let i = UIImageView()
        i.image = .scene8
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    private lazy var titleLabel: UILabel = {
       let l = UILabel()
        l.text = "Welcome to Home"
        l.textAlignment = .left
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        l.textColor = .labelColorBlack
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func configureUI() {
        super.configureUI()
        view.addSubview(titleLabel)
        view.addSubview(imageView)
    }
    override func configureConstraints() {
        super.configureConstraints()
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 139),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant:17),
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.035)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 105),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 28),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.76),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.183)
        ])
    }
  
   
}
