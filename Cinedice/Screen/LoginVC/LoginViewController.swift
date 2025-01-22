//
//  LoginViewController.swift
//  Netflix
//
//  Created by samet on 1.12.2024.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    lazy private var emailTextField: UITextField = {
        var emailTextField = UITextField()
       emailTextField.delegate = self
       emailTextField.placeholder = "Email"
       emailTextField.borderStyle = .roundedRect
        emailTextField.layer.borderColor = UIColor.gray.cgColor
        emailTextField.layer.borderWidth = CGFloat(0.6)
        emailTextField.layer.cornerRadius = CGFloat(10)
        
        let iconView = UIImageView(image: UIImage(systemName: "person.fill"))
        iconView.tintColor = .label // İkon rengini siyah yap
        iconView.contentMode = .scaleAspectFit
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 50))
        iconView.frame = CGRect(x: 5, y: (paddingView.frame.height - iconView.frame.height) / 2, width: 20, height: 20)
        paddingView.addSubview(iconView)
        
        emailTextField.leftView = paddingView
        emailTextField.leftViewMode = .always
        return emailTextField
    }()
    
    lazy var alreadyLabel: UILabel = {
        var label = UILabel()
        label.text = "Don't have a account?"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var buttonSingUp: UIButton = {
        var button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    
    lazy private var passwordTextField: UITextField = {
        var passwordTextField = UITextField()
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.borderColor = UIColor.gray.cgColor
        passwordTextField.layer.borderWidth = CGFloat(0.6)
        passwordTextField.layer.cornerRadius = CGFloat(10)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        passwordTextField.placeholder = "Password"
        
        let showButton = UIButton(type: .custom)
        showButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        showButton.tintColor = .label
        showButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        
        let lefIcon = UIImageView(image: UIImage(systemName: "lock.fill"))
        lefIcon.tintColor = .label
        lefIcon.contentMode = .scaleAspectFit
        
        let leftPadding = UIView(frame:   CGRect(x: 0, y: 0, width: 35, height: 50))
        lefIcon.frame = CGRect(x: 5, y: (leftPadding.frame.height - lefIcon.frame.height) / 2, width: 20, height: 20)
        leftPadding.addSubview(lefIcon)
        
        passwordTextField.leftView = leftPadding
        passwordTextField.leftViewMode = .always
       
        
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50)) // Sol padding arttırıldı
        showButton.frame = CGRect(x: 10, y: (paddingView.frame.height - showButton.frame.height) / 2, width: 20, height: 20) // Butonun x koordinatını 10 yaptık
        paddingView.addSubview(showButton)
        showButton.center = CGPoint(x: showButton.center.x, y: paddingView.bounds.height / 2)
        passwordTextField.rightView = paddingView
        passwordTextField.rightViewMode = .always
        return passwordTextField
    }()
    
    lazy var alreadyContainer = UIView()
    
    lazy private var logo: UILabel = {
         var logo = UILabel()
         logo.text = "cinedice"
         logo.textAlignment = .center
        logo.textColor = .label
         logo.font = UIFont(name: "JimNightshade-Regular", size: 64) // Font ismini buraya yazın
         return logo
     }()
    private let loginButton =  CustomButton(title: "Sign In", titleColor: .white, backgroundColor: .white, borderColor: .none)
    lazy var forgotPasswordButton:UIButton = {
        var button = UIButton()
        button.setTitle("Forgotten Password", for: .normal)
        button.setTitleColor(.blue, for: .normal )
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return button
    }()
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

    lazy private var label: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.tintColor = .gray
        // "Or" metnini ortalayarak, yatay çizgiler ekleyelim
        let attributedString = NSMutableAttributedString(string: "OR")
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
        configure()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func configure() {
        view.addSubview(signInFaceBookButton)
        view.addSubview(singInAppleLogin)
        view.addSubview(singInGoogleButton)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(logo)
        view.addSubview(forgotPasswordButton)
        view.addSubview(label)
        view.addSubview(alreadyContainer)
        let stackView = UIStackView(arrangedSubviews: [alreadyLabel, buttonSingUp])
        stackView.spacing = 8
        alreadyContainer.addSubview(stackView)
       

        
        logo.snp.makeConstraints { make in
                  make.top.equalToSuperview().offset(120) // Logonun üstten mesafesi
                  make.centerX.equalToSuperview() // Yatay olarak ortala
              }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(UIScreen.main.bounds.height * 0.25) // Ekranın üstünden %25 aşağıda
            make.centerX.equalToSuperview() // Yatay olarak ortala
            make.left.equalToSuperview().offset(20) // Sol taraftan 20 birim boşluk
            make.right.equalToSuperview().offset(-20) // Sağ taraftan 20 birim boşluk
            make.height.equalTo(50) // Yükseklik ayarla
        }

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20) // Email'in altına 20 birim boşluk
            make.centerX.equalToSuperview() // Yatay olarak ortala
            make.left.equalToSuperview().offset(20) // Sol taraftan 20 birim boşluk
            make.right.equalToSuperview().offset(-20) // Sağ taraftan 20 birim boşluk
            make.height.equalTo(50) // Yükseklik ayarla
        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-20)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(30) // 10 yerine 30 birim mesafe
            make.left.equalToSuperview().offset(20) // Sol taraftan 20 birim boşluk
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(30)
              make.centerX.equalToSuperview() // Yatayda ortala
          }
        
   
   
        signInFaceBookButton.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(30)
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
        
        alreadyContainer.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom) // Ekranın altına sabitler
            make.centerX.equalToSuperview() // Yatayda ortalar
            make.height.equalTo(50)
          
    
    
        }

        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview() // Hem yatay hem dikey olarak container içinde ortalar
        }
        
        
  
    }
    
    @objc private func togglePasswordVisibility(sender: UIButton) {
          passwordTextField.isSecureTextEntry.toggle() // Şifre görünürlüğünü değiştir
          let iconName = passwordTextField.isSecureTextEntry ? "eye.slash" : "eye"
          sender.setImage(UIImage(systemName: iconName), for: .normal) // İkonu değiştir
      }
    
    @objc private func actionHandleGoogleSignin(sender: UIButton) {
          passwordTextField.isSecureTextEntry.toggle() // Şifre görünürlüğünü değiştir
          let iconName = passwordTextField.isSecureTextEntry ? "eye.slash" : "eye"
          sender.setImage(UIImage(systemName: iconName), for: .normal) // İkonu değiştir
      }
    
    @objc private func actionHandleAppleSignin(sender: UIButton) {
          passwordTextField.isSecureTextEntry.toggle() // Şifre görünürlüğünü değiştir
          let iconName = passwordTextField.isSecureTextEntry ? "eye.slash" : "eye"
          sender.setImage(UIImage(systemName: iconName), for: .normal) // İkonu değiştir
      }
    
    @objc private func actionHandleFacebookSignin(sender: UIButton) {
          passwordTextField.isSecureTextEntry.toggle() // Şifre görünürlüğünü değiştir
          let iconName = passwordTextField.isSecureTextEntry ? "eye.slash" : "eye"
          sender.setImage(UIImage(systemName: iconName), for: .normal) // İkonu değiştir
      }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
