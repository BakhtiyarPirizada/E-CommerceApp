//
//  ThirdViewController.swift
//  E-CommerceApp
//
//  Created by Bakhtiyar Pirizada on 05.11.24.
//

import UIKit

class ThirdViewController: BaseViewController {
    private lazy var imageView: UIImageView = {
        let i = UIImageView()
        i.image = .scene3
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    private lazy var nextImage: UIImageView = {
        let i = UIImageView()
        i.image = .nextButton
        i.isUserInteractionEnabled = true
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    private lazy var layoutImage: UIImageView = {
        let i = UIImageView()
        i.image = .scene3Layout
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    private lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.text = "Reach the unknown spot"
        l.textAlignment = .left
        l.numberOfLines = 2
        l.font = UIFont.systemFont(ofSize: 36, weight: .heavy)
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    private lazy var subTitleLabel: UILabel = {
        let l = UILabel()
        l.text = "To your destination"
        l.textAlignment = .left
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        l.textColor = .labelColorGrey
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    override func configureUI() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(nextImage)
        view.addSubview(layoutImage)
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
       gestureRecognizer()
    }
    
    override func configureConstraints() {
        super.configureConstraints()
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 174),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 263)
        ])
        NSLayoutConstraint.activate([
            nextImage.widthAnchor.constraint(equalToConstant: 50),
            nextImage.heightAnchor.constraint(equalToConstant: 50),
            nextImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -58),
            nextImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -66)
        ])
        NSLayoutConstraint.activate([
            layoutImage.widthAnchor.constraint(equalToConstant: 48),
            layoutImage.heightAnchor.constraint(equalToConstant: 6),
            layoutImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            layoutImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -110)
        ])
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -183),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant:10),
            titleLabel.widthAnchor.constraint(equalToConstant: 250),
            titleLabel.heightAnchor.constraint(equalToConstant: 90)
        ])
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            subTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant:10),
            subTitleLabel.widthAnchor.constraint(equalToConstant: 250),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 33)
        ])
        
    }
    
    fileprivate func gestureRecognizer() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showThirdScene))
        nextImage.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc fileprivate func showThirdScene() {
        let controller = FourthViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    

}

