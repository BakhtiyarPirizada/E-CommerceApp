//
//  LoginViewController.swift
//  E-CommerceApp
//
//  Created by Bakhtiyar Pirizada on 05.11.24.
//

import UIKit

class LoginViewController: BaseViewController {
    
    private lazy var imageView: UIImageView = {
        let i = UIImageView()
        i.image = .scene5
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    private lazy var titleLabel: UILabel = {
       let l = UILabel()
        l.text = "Welcome back"
        l.textAlignment = .left
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        l.textColor = .labelColorBlack
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    private lazy var subTitleLabel: UILabel = {
       let l = UILabel()
        l.text = "sign in to access your account"
        l.textAlignment = .left
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        l.textColor = .labelColorGrey
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    private lazy var rememberLabel: UILabel = {
       let l = UILabel()
        l.text = "Remember me"
        l.textAlignment = .center
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 9, weight: .semibold)
        l.textColor = .labelColorGrey
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    private lazy var newMemberLabel: UILabel = {
       let l = UILabel()
        l.text = "New member ? Register now"
        l.textAlignment = .center
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        l.textColor = .labelColorGrey
        let attributedText = NSMutableAttributedString(string: l.text!)
        let range = (l.text! as NSString).range(of: "Register now")
        attributedText.addAttribute(.foregroundColor, value: UIColor.authBG, range: range)
        l.attributedText = attributedText
        l.isUserInteractionEnabled = true
        gestureRecognizer(to: l, action: #selector(showRegisterScene))
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
   
    private lazy var forgotPassLabel: UILabel = {
       let l = UILabel()
        l.text = "Forgot password?"
        l.textAlignment = .center
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 9, weight: .semibold)
        l.textColor = .authBG
        l.isUserInteractionEnabled = true
        gestureRecognizer(to: l, action: #selector(forgotPassword))
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var eyeButton: UIButton = {
        let b = UIButton(type: .custom)
        b.setImage(UIImage(systemName: "eye"), for: .normal)
        b.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        b.tintColor = .labelColorGrey
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        return b
    }()
 
    private lazy var rememberButton: UIButton = {
        let b = UIButton(type: .custom)
        b.setImage(UIImage(systemName: "square"), for: .normal)
        b.setImage(UIImage(systemName: "checkmark.square"), for: .selected)
        b.tintColor = .labelColorGrey
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(toggleRememberMe), for: .touchUpInside)
        return b
    }()

    private lazy var emailText: UITextField = {
       let t = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: t.frame.height))
        t.placeholder = "  Enter your email"
        t.textColor = .labelColorGrey
        t.backgroundColor = .textFieldBG.withAlphaComponent(0.2)
        t.delegate = self
        t.leftView = paddingView
        t.leftViewMode = .always
        t.layer.cornerRadius = 12
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    private lazy var passwordText: UITextField = {
       let t = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: t.frame.height))
        t.placeholder = "  Enter your password"
        t.textColor = .labelColorGrey
        t.backgroundColor = .textFieldBG.withAlphaComponent(0.2)
        t.delegate = self
        t.leftView = paddingView
        t.leftViewMode = .always
        t.rightView = eyeButton
        t.rightViewMode = .always
        t.layer.cornerRadius = 12
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    private lazy var nextButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Next", for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        b.titleLabel?.textColor = .white
        b.backgroundColor = .authBG
        b.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
        b.layer.cornerRadius = 12
        return b
    }()
    @objc
    fileprivate func nextButtonClicked() {
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    fileprivate func gestureRecognizer(to view: UIView, action: Selector) {
        let tapGesture = UITapGestureRecognizer(target: self, action: action)
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc fileprivate func showRegisterScene() {
        let controller = RegisterController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func togglePasswordVisibility() {
           passwordText.isSecureTextEntry.toggle()
           eyeButton.isSelected.toggle()
       }
    
    @objc func toggleRememberMe() {
           rememberButton.isSelected.toggle()
       }
    @objc func forgotPassword() {

       }
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func configureUI() {
        super.configureUI()
        view.backgroundColor = .white
        view.addSubview(imageView)
        imageView.addSubview(titleLabel)
        imageView.addSubview(subTitleLabel)
        view.addSubview(emailText)
        view.addSubview(passwordText)
        view.addSubview(forgotPassLabel)
        view.addSubview(rememberLabel)
        view.addSubview(rememberButton)
        view.addSubview(nextButton)
    }
    override func configureConstraints() {
        super.configureConstraints()
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 5),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 138),
            titleLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant:28),
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.43),
            titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.035)
        ])
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            subTitleLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant:26),
            subTitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.53),
            subTitleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.021)
        ])
        NSLayoutConstraint.activate([
            emailText.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 45),
            emailText.leftAnchor.constraint(equalTo: view.leftAnchor, constant:20),
            emailText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20) ,
            emailText.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.059)
        ])
        NSLayoutConstraint.activate([
            passwordText.topAnchor.constraint(equalTo: emailText.bottomAnchor, constant: 12),
            passwordText.leftAnchor.constraint(equalTo: view.leftAnchor, constant:20),
            passwordText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            passwordText.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.059)
        ])
        NSLayoutConstraint.activate([
            forgotPassLabel.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 14),
            forgotPassLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -14)
        ])
        NSLayoutConstraint.activate([
            rememberLabel.centerYAnchor.constraint(equalToSystemSpacingBelow: forgotPassLabel.centerYAnchor, multiplier: 0) ,
            rememberLabel.leftAnchor.constraint(equalTo: rememberButton.rightAnchor, constant: 4)
        ])
        NSLayoutConstraint.activate([
            rememberButton.centerYAnchor.constraint(equalToSystemSpacingBelow: rememberLabel.centerYAnchor, multiplier: 0) ,
            rememberButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 14),
            rememberButton.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.015),
            rememberButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.015)
        ])
        NSLayoutConstraint.activate([
            nextButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            nextButton.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -68),
            nextButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06)
        ])
    }

}
extension LoginViewController:UITextFieldDelegate {
    
}
