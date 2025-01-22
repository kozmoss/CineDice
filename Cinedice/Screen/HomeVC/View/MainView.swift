//
//  MainView.swift
//  Netflix
//
//  Created by samet on 28.11.2024.
//

import UIKit

class MainView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createUI() {
        lazy var heroImageView = UIImageView()
        heroImageView.image = UIImage(named: "jpg")
        heroImageView.contentMode = .scaleAspectFit
        heroImageView.clipsToBounds = true
        
        addSubview(heroImageView)
        heroImageView.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(UIScreen.main.bounds.height * 0.35)
        }
        addGradient()
        lazy var playButton = UIButton()
        playButton.setTitle("Play", for: .normal)
        playButton.layer.borderColor = UIColor.white.cgColor
        playButton.layer.borderWidth = 1
        playButton.layer.cornerRadius = 10
        addSubview(playButton)
        playButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(screenHeight * 0.6)
            make.left.equalToSuperview().offset(screenWidth * 0.2)
            make.width.equalTo(100)
        }
        
        lazy var downloadButton = UIButton()
        downloadButton.setTitle("Download", for: .normal)
        downloadButton.layer.borderColor = UIColor.white.cgColor
        downloadButton.layer.borderWidth = 1
        downloadButton.layer.cornerRadius = 10
        addSubview(downloadButton)
        downloadButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(screenHeight * 0.6)
            make.right.equalToSuperview().offset(screenWidth * -0.2)
            make.width.equalTo(100)
        }
        
    }
    
    private func addGradient() {
        lazy var gradientLayer = CAGradientLayer()
          gradientLayer.frame = bounds
          
          // Renk geçişi: Açık yukarıda, koyu aşağıda
          gradientLayer.colors = [
              UIColor.clear.cgColor,                          // Üst kısımda şeffaf
              UIColor.black.withAlphaComponent(0.5).cgColor   // Alt kısımda koyuluk
          ]
          
          // Geçişin konumları (0.0 başlangıç, 1.0 bitiş)
          gradientLayer.locations = [0.0, 1.0]
          
          // Gradient yönü (yukarıdan aşağıya)
          gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0) // Üst
          gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)   // Alt
          
          layer.addSublayer(gradientLayer)
    }

}
