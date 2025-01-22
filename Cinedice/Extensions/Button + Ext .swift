import UIKit

class CustomButton: UIView {
    
    private let leftIconView = UIImageView()
    private let rightIconView = UIImageView()
    private let titleLabel = UILabel()

    enum IconType {
        case system
        case image
    }

    init(
        title: String,
        leftIconName: String? = nil,
        rightIconName: String? = nil,
        leftIconType: IconType = .system,
        rightIconType: IconType = .system,
        titleColor: UIColor = .black,
        titleFontSize: CGFloat = 18, // Başlık font boyutunu özelleştirme
        backgroundColor: UIColor = .clear,
        cornerRadius: CGFloat = 10,
        borderColor: CGColor? = UIColor.gray.cgColor, // Default olarak gri border
        borderWidth: CGFloat = 1 // Varsayılan borderWidth
    ) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false

        // Dinamik renkler ile background ve title renklerini ayarlıyoruz
        let dynamicTitleColor = UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return backgroundColor == .white ? .black : .white // Dark mode için beyaz
            default:
                return titleColor // Light mode için verilen titleColor
            }
        }
        
        let dynamicIconColor = UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return .white // Dark mode için beyaz
            default:
                return .black // Light mode için siyah
            }
        }
        
        let dynamicBackGroundColor = UIColor { traitCollection in
                 switch traitCollection.userInterfaceStyle {
                 case .dark:
                     return backgroundColor == .black ? .white : backgroundColor // Dark mode için siyah -> beyaz, diğer durumlar backgroundColor
                 default:
                     return backgroundColor == .white ? .black : backgroundColor // Light mode için beyaz -> siyah, diğer durumlar backgroundColor
                 }
             }

        // Arka Plan ve Köşe Yuvarlama
        self.backgroundColor = dynamicBackGroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth

        // Sol İkon
        if let leftIconName = leftIconName {
            let leftIcon = (leftIconType == .system ? UIImage(systemName: leftIconName) : UIImage(named: leftIconName))
            leftIconView.image = leftIcon
            leftIconView.tintColor = dynamicIconColor // Dinamik ikon rengi
            leftIconView.contentMode = .scaleAspectFit
        }

        // Sağ İkon
        if let rightIconName = rightIconName {
            let rightIcon = (rightIconType == .system ? UIImage(systemName: rightIconName) : UIImage(named: rightIconName))
            rightIconView.image = rightIcon
            rightIconView.tintColor = dynamicIconColor // Dinamik ikon rengi
            rightIconView.contentMode = .scaleAspectFit
        }

        // Başlık
        titleLabel.text = title
        titleLabel.textColor = dynamicTitleColor // Dinamik başlık rengi
        titleLabel.font = UIFont.systemFont(ofSize: titleFontSize, weight: .medium)
        titleLabel.textAlignment = .center

        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        // Üç alt görünüm için düzenleyici ekleniyor
        let stackView = UIStackView(arrangedSubviews: [leftIconView, titleLabel, rightIconView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing // İkonlar uçlarda, metin ortada olacak şekilde düzen
        stackView.spacing = 8
        
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            leftIconView.widthAnchor.constraint(equalToConstant: 24), // İkon boyutu
            leftIconView.heightAnchor.constraint(equalToConstant: 24),
            
            rightIconView.widthAnchor.constraint(equalToConstant: 24),
            rightIconView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
}
