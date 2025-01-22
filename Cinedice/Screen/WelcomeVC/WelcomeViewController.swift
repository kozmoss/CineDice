//
//  WelcomeViewController.swift
//  Netflix
//
//  Created by samet on 7.12.2024.
//

import UIKit

class WelcomeViewController: UIViewController {
    var logoImageView = UIImageView(image: UIImage(named: "logoCinedice"))
    lazy var createAccount:UIButton = {
        var button = UIButton()
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(.blue, for: .normal )
        button.layer.borderWidth = CGFloat(0.5)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return button
    }()
    private let loginButton =  CustomButton(title: "Sign In", titleColor: .white, backgroundColor: .white, borderColor: .none)
    lazy private var logo: UILabel = {
         var logo = UILabel()
         logo.text = "cinedice"
         logo.textAlignment = .center
        logo.textColor = .label
         logo.font = UIFont(name: "JimNightshade-Regular", size: 64) // Font ismini buraya yazın
         return logo
     }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

    }
    
    func configure() {
        view.addSubview(logoImageView)
        view.addSubview(logo)
        view.addSubview(loginButton)
        view.addSubview(createAccount)
             
             // logoImageView Ayarları
        logo.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(5)
                  make.centerX.equalToSuperview() // Yatay olarak ortala
              }
        
             logoImageView.contentMode = .scaleAspectFit // Görselin boyutunu koruyarak sığdırır
             logoImageView.snp.makeConstraints { make in
                 make.top.equalToSuperview().offset(50) // Logonun üstten mesafesi
                 make.centerX.equalToSuperview()
                 make.width.height.equalTo(200)
             }
        
        loginButton.snp.makeConstraints { make in
            make.bottom.equalTo(createAccount.snp.top).offset(-20) // 10 yerine 30 birim mesafe
            make.left.equalToSuperview().offset(20) // Sol taraftan 20 birim boşluk
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)

        }
        
        createAccount.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom) // 10 yerine 30 birim mesafe
            make.left.equalToSuperview().offset(20) // Sol taraftan 20 birim boşluk
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)

        }
        
    }
}
