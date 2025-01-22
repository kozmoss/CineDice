//
//  RegisterViewController.swift
//  Netflix
//
//  Created by samet on 6.12.2024.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController {
    private let emailTextField = CustomTextField(placeholder: "Username")
    private let password = CustomTextField(placeholder: "Password", isSecure: true)
    private let passwordConfirm = CustomTextField(placeholder: "Confirm Password",isSecure: true)
    private let username = CustomTextField(placeholder: "Username")
   // var singInGoogleButton = CustomButton(title: "google", iconName: "google", iconType: .image, iconPosition: .leading, spacing: 10, titleColor: .black, titleLabelSize: 10)
    let signInFaceBookButton = CustomButton(
        title: "Continue with Facebook",
        leftIconName: "facebook", leftIconType: .image, titleFontSize:14
    )
    let singInAppleLogin = CustomButton(
        title: "Continue with Google",
        leftIconName: "google",
        leftIconType: .image,
        titleFontSize:14
    )

    let singInGoogleButton = CustomButton(
        title: "Continue with Apple",
        leftIconName: "apple.logo",
        titleFontSize: 14
    )
    
    private let signButton =  CustomButton(title: "Sign Up", titleColor: .white, backgroundColor: .white, borderColor: .none)
    private let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.font = UIFont.boldSystemFont(ofSize: 36)
        return label
    }()
    
    lazy private var labelOr: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.tintColor = .gray
        // "Or" metnini ortalayarak, yatay çizgiler ekleyelim
        let attributedString = NSMutableAttributedString(string: "Or")
        attributedString.addAttribute(.foregroundColor, value: UIColor.gray, range: NSRange(location: 0, length: attributedString.length))

        
        // Sol ve sağ çizgiyi ekleyelim
        let leftLine = NSAttributedString(string: " ───────────  ", attributes: [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.gray
        ])
        
        let rightLine = NSAttributedString(string: " ───────────", attributes: [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.gray
        ])
        
        // Çizgiler ve "Or" metnini birleştirelim
        attributedString.insert(leftLine, at: 0)  // Başına çizgi ekle
        attributedString.append(rightLine)  // Sonuna çizgi ekle
        
        label.attributedText = attributedString
        
        return label
    }()
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        congifure()
    }
    
    func congifure() {
        view.addSubview(emailTextField)
        view.addSubview(username)
        view.addSubview(password)
        view.addSubview(passwordConfirm)
        view.addSubview(signUpLabel)
        view.addSubview(signButton)
        view.addSubview(labelOr)

        view.addSubview(singInAppleLogin)
        view.addSubview(singInGoogleButton)
        view.addSubview(signInFaceBookButton)
        
        signUpLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
        }
        
        username.snp.makeConstraints { make in
            make.top.equalTo(signUpLabel.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(20) // Sol taraftan 20 birim boşluk
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(48)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(username.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(20) // Sol taraftan 20 birim boşluk
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(48)
        }
        
        password.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(48)
        }
        
        passwordConfirm.snp.makeConstraints { make in
            make.top.equalTo(password.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(48)
        }
        
        signButton.snp.makeConstraints { make in
            make.top.equalTo(passwordConfirm.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(20) // Sol taraftan 20 birim boşluk
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(48)
        }
        
        labelOr.snp.makeConstraints { make in
            make.top.equalTo(signButton.snp.bottom).offset(30)
              make.centerX.equalToSuperview() // Yatayda ortala
          }
        
   
   
        signInFaceBookButton.snp.makeConstraints { make in
            make.top.equalTo(labelOr.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(20) // Sol taraftan 20 birim boşluk
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(48)
     
        }
        
        singInGoogleButton.snp.makeConstraints { make in
            make.top.equalTo(signInFaceBookButton.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20) // Sol taraftan 20 birim boşluk
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(48)
   
        }
        
        singInAppleLogin.snp.makeConstraints { make in
            make.top.equalTo(singInGoogleButton.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20) // Sol taraftan 20 birim boşluk
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
    
        }
    }
    

}
