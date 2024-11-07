//
//  RegisterController.swift
//  E-CommerceApp
//
//  Created by Bakhtiyar Pirizada on 05.11.24.
//
import UIKit

class RegisterController: BaseViewController {
    
    private lazy var imageView: UIImageView = {
        let i = UIImageView()
        i.image = .scene5
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    private lazy var titleLabel: UILabel = {
       let l = UILabel()
        l.text = "Get Started"
        l.textAlignment = .left
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 36, weight: .semibold)
        l.textColor = .labelColorBlack
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    private lazy var subTitleLabel: UILabel = {
       let l = UILabel()
        l.text = "by creating a free account."
        l.textAlignment = .left
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        l.textColor = .labelColorGrey
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    private lazy var termsLabel: UILabel = {
       let l = UILabel()
        l.text = "By checking the box you agree to our Terms and Conditions"
        l.textAlignment = .center
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 9, weight: .semibold)
        l.textColor = .labelColorGrey
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    private lazy var alreadyMemberLabel: UILabel = {
       let l = UILabel()
        l.text = "Already a member? Login in"
        l.textAlignment = .center
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        l.textColor = .labelColorGrey
        let attributedText = NSMutableAttributedString(string: l.text!)
        let range = (l.text! as NSString).range(of: "Login in")
        attributedText.addAttribute(.foregroundColor, value: UIColor.authBG, range: range)
        l.attributedText = attributedText
        l.isUserInteractionEnabled = true
        gestureRecognizer(to: l, action: #selector(showLoginScene))
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
    private lazy var nameText: UITextField = {
       let t = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: t.frame.height))
        t.placeholder = "  Fullname"
        t.textColor = .labelColorGrey
        t.backgroundColor = .textFieldBG.withAlphaComponent(0.2)
        t.delegate = self
        t.leftView = paddingView
        t.leftViewMode = .always
        t.layer.cornerRadius = 12
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    private lazy var numberText: UITextField = {
       let t = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: t.frame.height))
        t.placeholder = "  Phone number"
        t.textColor = .labelColorGrey
        t.backgroundColor = .textFieldBG.withAlphaComponent(0.2)
        t.delegate = self
        t.leftView = paddingView
        t.leftViewMode = .always
        t.layer.cornerRadius = 12
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()

    private lazy var emailText: UITextField = {
       let t = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: t.frame.height))
        t.placeholder = "  Valid email"
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
        t.placeholder = "  Strong password"
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
    
    @objc fileprivate func showLoginScene() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func togglePasswordVisibility() {
           passwordText.isSecureTextEntry.toggle()
           eyeButton.isSelected.toggle()
       }
    
    @objc func toggleRememberMe() {
           rememberButton.isSelected.toggle()
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
        view.addSubview(termsLabel)
        view.addSubview(rememberButton)
        view.addSubview(nextButton)
        view.addSubview(alreadyMemberLabel)
        view.addSubview(nameText)
        view.addSubview(numberText)
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
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.035)
        ])
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            subTitleLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant:26),
            subTitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.53),
            subTitleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.021)
        ])
       
        NSLayoutConstraint.activate([
            nameText.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 22),
            nameText.leftAnchor.constraint(equalTo: view.leftAnchor, constant:20),
            nameText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20) ,
            nameText.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.059)
        ])
        NSLayoutConstraint.activate([
            emailText.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: 12),
            emailText.leftAnchor.constraint(equalTo: view.leftAnchor, constant:20),
            emailText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20) ,
            emailText.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.059)
        ])
        NSLayoutConstraint.activate([
            numberText.topAnchor.constraint(equalTo: emailText.bottomAnchor, constant: 12),
            numberText.leftAnchor.constraint(equalTo: view.leftAnchor, constant:20),
            numberText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20) ,
            numberText.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.059)
        ])
        NSLayoutConstraint.activate([
            passwordText.topAnchor.constraint(equalTo: numberText.bottomAnchor, constant: 12),
            passwordText.leftAnchor.constraint(equalTo: view.leftAnchor, constant:20),
            passwordText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            passwordText.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.059)
        ])
       
        NSLayoutConstraint.activate([
            termsLabel.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 14),
            termsLabel.leftAnchor.constraint(equalTo: rememberButton.rightAnchor, constant: 4)
        ])
        NSLayoutConstraint.activate([
            rememberButton.centerYAnchor.constraint(equalToSystemSpacingBelow: termsLabel.centerYAnchor, multiplier: 0) ,
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
        NSLayoutConstraint.activate([
            alreadyMemberLabel.topAnchor.constraint(equalTo: nextButton.bottomAnchor,constant: 14),
            alreadyMemberLabel.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0)
        ])
    }

}
extension RegisterController:UITextFieldDelegate {}
