//
//  FirstViewController.swift
//  E-CommerceApp
//
//  Created by Bakhtiyar Pirizada on 05.11.24.
//

import UIKit

class FirstViewController: BaseViewController {
    
    private lazy var imageView: UIImageView = {
        let i = UIImageView()
        i.image = .scene1
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func configureUI() {
       view.backgroundColor = .authBG
       view.addSubview(imageView)
       gestureRecognizer()
    }
    
    override func configureConstraints() {
        super.configureConstraints()
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 245),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.57) ,
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)
        ])
    }
    
    fileprivate func gestureRecognizer() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showSecondScene))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc fileprivate func showSecondScene() {
        let controller = SecondViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
