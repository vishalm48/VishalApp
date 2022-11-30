//
//  TitleCollectionViewCell.swift
//  VishalApp
//
//  Created by Amalnath N D on 21/11/22.
//

import UIKit
import Kingfisher
class TitleCollectionViewCell: UICollectionViewCell {
    
    static let indentifier = "TitleCollectionViewCell"

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
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    
    public func configure(with model: String){
        guard let url =  URL(string:"https://image.tmdb.org/t/p/w500/\(model)") else{
            return}
        posterImageView.kf.setImage(with: url)
    }
    
}
