//
//  HomeCollectionViewCell.swift
//  Netflix
//
//  Created by samet on 27.11.2024.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "MoviesColletionViewCell"
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        posterImageView.frame = contentView.bounds
    }
    
    public func configure(model:String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model)") else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            DispatchQueue.main.async {
                self.posterImageView.image = UIImage(data: data)
            }
       
        }.resume()
    }
    
}
